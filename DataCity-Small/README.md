# How to run
warning: **this is DEVELOPMENT version it may not work**

```
git clone https://github.com/disit/snap4city-docker
cd snap4city-docker/DataCity-Small
./setup.sh
docker-compose up -d
#to bring all services up will takes some minutes

#then setup virtuoso and elasticsearch (to be done only the first time)
./post-setup.sh
```

on the host are mapped ports:
- 80 for main interface
- 389, 636 for ldap server
- 1880 for nodered application
- 9000 for dashboard builder websocket server
- 8080 for personaldata service
- 8088 for keycloak access
- 3306 to access to mysql (for debugging)
- 6443 for phpldapadmin

**IMPORTANT:** you have to change in the client running the browser the hosts file (/etc/hosts or the windows equivalent C:\Windows\System32\drivers\etc\hosts) adding a row with
```
<docker machine ip>  dashboard keycloak wsserver iotapp personaldata myldap
```

wait the logs are stabilized and the db is created then open on the browser http://dashboard/dashboardSmartCity 
to login use the credentials provided on https://www.snap4city.org/drupal/node/487

to administrate the ldap server use https://myldap:6443/phpldapadmin and login with 
```
user: cn=admin,dc=ldap,dc=organization,dc=com 
password: secret
```

**Note:** when connecting to the server you need to use `http://dashboard/...` and NOT `http://localhost/...` or `http://<ip of server>/...` because the hostname in the connection is used to select the proper menu to be shown to the user and otherwise you will get an empty menu.
