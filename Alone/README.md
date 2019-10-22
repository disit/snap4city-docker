# How to run
warning: **this is BETA version**

```
cd snap4city-docker/Alone
docker-compose up
```
on the host are mapped ports:
- 80 for main interface
- 8080 for personaldata service
- 8088 for keycloak access
- 3306 to access to mysql (for debugging)
- 6443 for phpldapadmin

then you have to set in the client hosts file (/etc/hosts or the windows equivalent) a row with
```
<docker machine ip>  dashboard keycloak wsserver iotapp personaldata 
```

wait the logs are stabilized and the db is created then open on the browser http://dashboard/dashboardSmartCity 
to login use the credentials provided on https://www.snap4city.org/drupal/node/487

**Note:** when connecting to the server you need to use `http://dashboard/...` and NOT `http://localhost/...` or `http://<ip of server>/...` because the hostname in the connection is used to select the proper menu to be shown to the user and you will get an empty menu.
