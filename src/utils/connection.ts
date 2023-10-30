import { Client } from "pg";
import * as cfg from "../config/appConfig.json";
require("dotenv").config({
  path: "./.env",
});

const dbConfig = {
  user: process.env.POSTGRES_USER!,
  host: cfg.dbHost,
  database: process.env.POSTGRES_DB!,
  password: process.env.POSTGRES_PASSWORD!,
  port: parseInt(process.env.POSTGRES_PORT!, 10),
};

let client: Client;

async function connect(): Promise<boolean> {
  let retries = 5;
  while (retries) {
    try {
      client = new Client(dbConfig);
      await client.connect();
      console.log("Connected to PostgreSQL");
      return true;
    } catch (error) {
      console.error("Error connecting to PostgreSQL:", error);
      retries--;
      console.log("Retiries left:", retries);
      await new Promise((res) => setTimeout(res, 5000));
    }
  }
  return false;
}

async function disconnect() {
  if (client != null) {
    await client.end();
    console.log("Disconnected from PostgreSQL");
  } else {
    console.log("There was no connection to PostgreSQL");
  }
}

export { connect, disconnect, client };
