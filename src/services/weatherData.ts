import * as db from "../utils/connection";
import axios from "axios";
import {
  TruckData,
  StateData,
  TruckDataWithState,
  TrucksForAlerting,
} from "../types/trucks";
import { WeatherAlert } from "../types/weather";

async function getTruckData(): Promise<TruckData[]> {
  db.connect();
  try {
    const query = `
        SELECT
          t.TruckID,
          t.DriverName,
          t.DriverEmail,
          g.Latitude,
          g.Longitude,
          g.Timestamp AS LatestTimestamp
        FROM
          Trucks t
        LEFT JOIN LATERAL (
          SELECT Latitude, Longitude, Timestamp
          FROM GPSData g
          WHERE t.TruckID = g.TruckId
          ORDER BY g.Timestamp DESC
          LIMIT 1
        ) g ON true
      `;

    const result = await db.client.query(query);
    db.disconnect();
    const trucks: TruckData[] = result.rows;
    return trucks;
  } catch (error) {
    console.error("Error retrieving truck data:", error);
    return [];
  }
}

async function fetchStateInfo(
  latitude: number,
  longitude: number
): Promise<StateData> {
  try {
    const response = await axios.get(
      `https://api.weather.gov/points/${latitude},${longitude}`
    );
    const stateInfo: StateData = {
      state: response.data.properties.relativeLocation.properties.state,
      zone: response.data.properties.forecastZone,
    };

    return stateInfo;
  } catch (error) {
    console.error("Error fetching state information:", error);
    return { state: "", zone: "" };
  }
}

async function getTruckDataWithStates(
  truckData: TruckData[]
): Promise<TruckDataWithState[]> {
  const truckDataWithStates: TruckDataWithState[] = [];

  for (const item of truckData) {
    const stateData = await fetchStateInfo(item.latitude, item.longitude);
    truckDataWithStates.push({
      ...item,
      state: stateData.state,
      zone: stateData.zone,
    });
  }

  return truckDataWithStates;
}

async function fetchWeatherAlerts(state: string): Promise<WeatherAlert[]> {
  try {
    const response = await axios.get(
      `https://api.weather.gov/alerts/active?area=${state}`
    );
    const alerts = response.data.features.map((feature: any) => {
      return {
        areaDesc: feature.properties.areaDesc,
        headline: feature.properties.headline,
        description: feature.properties.description,
        instruction: feature.properties.instruction,
        effective: feature.properties.effective,
        expires: feature.properties.expires,
        severity: feature.properties.severity,
        affectedZones: feature.properties.affectedZones,
      };
    });
    return alerts;
  } catch (error) {
    console.error(`Error fetching weather alerts for ${state}:`, error);
    return [];
  }
}
async function getWeatherAlertsForStates(
  distinctStates: string[],
  minSeverity: string
): Promise<{ [state: string]: WeatherAlert[] }> {
  const weatherAlertsByState: { [state: string]: WeatherAlert[] } = {};

  for (const state of distinctStates) {
    const alerts = await fetchWeatherAlerts(state);

    const filteredAlerts = alerts.filter(
      (alert) => alert.severity >= minSeverity
    );

    if (filteredAlerts.length > 0) {
      weatherAlertsByState[state] = filteredAlerts;
    }
  }

  return weatherAlertsByState;
}

function getTruckDataWithCommonAlerts(
  truckDataWithState: TruckDataWithState[],
  weatherAlertsByState: { [state: string]: WeatherAlert[] }
): TrucksForAlerting[] {
  const result: TrucksForAlerting[] = [];

  for (const data of truckDataWithState) {
    const state = data.state;
    const zone = data.zone;

    if (weatherAlertsByState[state]) {
      const commonAlerts = weatherAlertsByState[state].filter((alert) =>
        alert.affectedZones.includes(zone)
      );

      if (commonAlerts.length > 0) {
        const itemWithAlerts = { ...data, alerts: commonAlerts };
        result.push(itemWithAlerts);
      }
    }
  }

  return result;
}

async function getWeatherAlertsForTrucks(
  severity: string
): Promise<TrucksForAlerting[]> {
  const truckData = await getTruckData();
  const truckDataWithStates = await getTruckDataWithStates(truckData);
  const distinctStates = Array.from(
    new Set(truckDataWithStates.map((truck) => truck.state))
  );
  const statesWeatherAlertList = await getWeatherAlertsForStates(
    distinctStates,
    severity
  );

  const trucksForAlerting = getTruckDataWithCommonAlerts(
    truckDataWithStates,
    statesWeatherAlertList
  );
  return trucksForAlerting;
}

export { getWeatherAlertsForTrucks };
