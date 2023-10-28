import schedule from "node-schedule";
import { alertDrivers } from "./services/alertDrivers";
import * as config from "./config/appConfig.json";

const job = schedule.scheduleJob(config.cronSchedule, () => {
  console.log("Executing inform Routine");
  alertDrivers(config.weatherSeverity); //Minor, Moderate, Severe, Extreme,
});
