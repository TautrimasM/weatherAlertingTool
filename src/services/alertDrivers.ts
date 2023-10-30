import * as weatherData from "./weatherData";
import * as emailer from "../utils/emailer";
import { generateEmailData } from "../templates/emailGenerator";
import * as config from "../config/appConfig.json";

export async function alertDrivers(severity: string) {
  const trucksForAlerting = await weatherData.getWeatherAlertsForTrucks(
    severity
  );
  if (config.demo.logTrucksForAlerting) {
    console.log(trucksForAlerting);
  }
  if(trucksForAlerting.length == 0){
    return;
  }

  const emailData = generateEmailData(trucksForAlerting);
  if (config.demo.logEmailData) {
    console.log(emailData);
  }

  const result = await emailer.sendEmails(emailData);
  if (config.demo.logEmailResult) {
    console.log(result);
  }
}
