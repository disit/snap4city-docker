# How to run
warning: **this is DEVELOPMENT version it may not work**

```
git clone https://github.com/disit/snap4city-docker
cd snap4city-docker/DataCity-Small

# setup directories write permissions
./setup.sh

#bring all services up
docker-compose up -d
#to bring all services up will takes some minutes

#then setup virtuoso and elasticsearch (to be done only the first time but no problem if you repeat)
./post-setup.sh
```

on the host are mapped ports:
- 80 for main interface accessible via http://dashboard/dashboardSmartCity
- 389, 636 for ldap server
- 1880 for nodered application 1
- 1881 for nodered application 2
- 9000 for dashboard builder websocket server
- 8080 for personaldata service
- 8088 for keycloak access
- 3306 to access to mysql (for debugging)
- 6443 for phpldapadmin
- 1026 for orion
- 8443 for orionbrokerfilter
- 9200 for elasticsearch
- 5601 for kibana
- 9090 for nifi

in this version many services are proxied from the apache2 server running on "dashboard" container:
- http://dashboard/auth/... for keycloak
- http://dashboard/ServiceMap/ for servicemap and iot api
- http://dashboard/superservicemap/ for superservicemap
- http://dashboard/wsserver for websocket server
- http://dashboard/datamanager/ for datamanager
- http://dashboard/iotapp/nr1/ for iotapp 1
- http://dashboard/iotapp/nr2/ for iotapp 2
these settings can be changed if needed in the apache-proxy.conf file, in particular if you add another nodered app.

**IMPORTANT:** you have to change in the client running the browser the hosts file (/etc/hosts or the windows equivalent C:\Windows\System32\drivers\etc\hosts) adding a row with
```
<docker machine ip>  dashboard keycloak wsserver iotapp personaldata myldap nifi kibana elasticsearch
```

wait the logs are stabilized and the db is created then open on the browser http://dashboard/dashboardSmartCity 
to login use the credentials provided on https://www.snap4city.org/drupal/node/487

to administrate the ldap server use https://myldap:6443/phpldapadmin and login with 
```
user: cn=admin,dc=ldap,dc=organization,dc=com 
password: secret
```

**Note:** when connecting to the server you need to use `http://dashboard/...` and NOT `http://localhost/...` or `http://<ip of server>/...` because the hostname in the connection is used to select the proper menu to be shown to the user and otherwise you will get an empty menu.

## Setting up the broker
TBD

## Adding a nodered app
TBD

## Adding an orion broker
TBD
