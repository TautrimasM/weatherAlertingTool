import { TrucksForAlerting } from "../types/trucks";

export function generateEmailData(trucksForAlerting: TrucksForAlerting[]) {
  const emailData: { email: string; subject: string; message: string }[] = [];

  for (const truckDataWithAlerts of trucksForAlerting) {
    const emailMessage = `
        <p>Truck ID: ${truckDataWithAlerts.truckid}</p>
        <p>Driver Name: ${truckDataWithAlerts.drivername}</p>
        <p>Latitude: ${truckDataWithAlerts.latitude}</p>
        <p>Longitude: ${truckDataWithAlerts.longitude}</p>
        <p>Latest GPS Timestamp: ${truckDataWithAlerts.latesttimestamp}</p>
        <p>State: ${truckDataWithAlerts.state}</p>
        <p>Zone: ${truckDataWithAlerts.zone}</p>
        <p>Alert Headline: ${truckDataWithAlerts.alerts[0].headline}</p>
        <p>Alerts:</p>
        <ul>
        <li>Description: ${truckDataWithAlerts.alerts[0].description}</li>
        <li>Instruction: ${truckDataWithAlerts.alerts[0].instruction}</li>
        <li>Effective: ${truckDataWithAlerts.alerts[0].effective}</li>
        <li>Expires: ${truckDataWithAlerts.alerts[0].expires}</li>
        <li>Severity: ${truckDataWithAlerts.alerts[0].severity}</li>
        </ul>
      `;

    emailData.push({
      email: truckDataWithAlerts.driveremail,
      subject: `${truckDataWithAlerts.alerts[0].severity} Weather Alert`,
      message: emailMessage,
    });
  }

  return emailData;
}
