FROM php:7.2-apache
COPY dashboard-builder/dashboard_frontend /var/www/html/dashboardSmartCity
COPY snap4city/Ownership-API /var/www/html/ownership-api
RUN chmod a+x /var/www/html/dashboardSmartCity/ScheduledTasks/*.sh

COPY notificator/www/ /var/www/html/notificator
COPY snap4city/IoTApplication-API /var/www/html/snap4city-application-api

RUN a2enmod proxy_http proxy_wstunnel

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN apt-get update && apt-get -y install cron
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN \
    apt-get update && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap 
