# How to run
warning: this is still BETA version

```
cd snap4city-docker/Alone
docker-compose up
```

then you have to set in the client hosts file (/etc/hosts or the windows equivalent) a row with
```
<docker machine ip>  dashboard keycloak wsserver iotapp personaldata 
```

wait the logs are stabilized and the db is created then open on the browser http://dashboard/dashboardSmartCity 
to login use the credentials provaided on https://www.snap4city.org/drupal/node/487
