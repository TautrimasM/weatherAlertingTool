import { WeatherAlert } from "./weather";

export interface TruckData {
  truckid: string;
  drivername: string;
  driveremail: string;
  latitude: number;
  longitude: number;
  latesttimestamp: Date;
}

export interface StateData {
  state: string;
  zone: string;
}

export interface TruckDataWithState extends TruckData {
  state: string;
  zone: string;
}

export interface TrucksForAlerting extends TruckDataWithState {
  alerts: WeatherAlert[];
}
