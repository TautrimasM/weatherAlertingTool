# WeatherAlertingTool

App that gets Trucks coordinates from database, fetch their state info and active weather alerts and informs truck drivers about severe weather conditions

## Usage

App is dockerized, so all you have to do is set desired app settings in appConfig.prod.json, set database and SMTP server settings in .env file an run

Start program:
```
docker compose up
```

If you want to play around, you can run database only in a docker container:
```
 docker compose -f docker-compose.dev.yml up
```

and app itself:
```
npm run dev
```

In such case you can set development config in src/config/appConfig.json

Example DB data for development pusrposes is stored in /data directory, it loads when creating docker container.

For full functionality don't forget to set your SMTP server, I have tested it with Gmail SMTP server
