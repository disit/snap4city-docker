FROM php:7.3-apache as php-7.3-base

RUN a2enmod proxy_http proxy_wstunnel rewrite ssl

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN echo "sendmail_path=/usr/bin/msmtp -t" >> $PHP_INI_DIR/conf.d/php-sendmail.ini

RUN apt-get update && \ 
    apt-get -y install locales msmtp mailutils cron nano libapache2-mod-auth-openidc && \
    echo en_US.UTF-8 UTF-8 >> /etc/locale.gen && \
    echo it_IT.UTF-8 UTF-8 >> /etc/locale.gen && \
    echo ja_JP.UTF-8 UTF-8 >> /etc/locale.gen && \
    echo ar_SA.UTF-8 UTF-8 >> /etc/locale.gen && \
    echo el_GR.UTF-8 UTF-8 >> /etc/locale.gen && \
    echo fr_FR.UTF-8 UTF-8 >> /etc/locale.gen && \
    echo de_DE.UTF-8 UTF-8 >> /etc/locale.gen && \
    echo nl_NL.UTF-8 UTF-8 >> /etc/locale.gen && \
    echo fi_FI.UTF-8 UTF-8 >> /etc/locale.gen && \
    echo sv_SE.UTF-8 UTF-8 >> /etc/locale.gen && \
    locale-gen 

RUN touch /etc/msmtprc && chown www-data.www-data /etc/msmtprc
RUN docker-php-ext-install gettext mysqli pdo pdo_mysql
RUN \
    apt-get update && \
    apt-get install -y libpq-dev && docker-php-ext-install pdo pdo_pgsql && \
    apt-get install libldap2-dev -y && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap 

#########################################
FROM alpine:latest as builder
RUN apk update && apk add git
RUN git clone https://github.com/disit/dashboard-builder
RUN git clone https://github.com/disit/snap4city
RUN git clone https://github.com/disit/notificator
RUN git clone https://github.com/disit/iot-directory
RUN git clone https://github.com/disit/process-loader
RUN git clone https://github.com/disit/multiservicemap
#RUN git clone https://github.com/disit/heatmap

#########################################
FROM php-7.3-base

ENV PHP_MEMORY_LIMIT=512m
ENV PHP_UPLOAD_MAX_FILESIZE=5M
ENV PHP_SESSION_GC_MAXLIFETIME=86400
ENV PHP_SESSION_COOKIE_LIFETIME=0
COPY php.ini /usr/local/etc/php

COPY --from=builder dashboard-builder/dashboard_frontend /var/www/html/dashboardSmartCity
COPY config.php /var/www/html/dashboardSmartCity
COPY --from=builder snap4city/Ownership-API /var/www/html/ownership-api
RUN chmod a+x /var/www/html/dashboardSmartCity/ScheduledTasks/*.sh
RUN chown -R www-data /var/www/html/dashboardSmartCity/img
COPY --from=builder notificator/www/ /var/www/html/notificator
COPY --from=builder snap4city/IoTApplication-API /var/www/html/snap4city-application-api
COPY --from=builder iot-directory/web /var/www/html/iot-directory
COPY --from=builder process-loader/www /var/www/html/processloader
COPY --from=builder multiservicemap/web /var/www/html/MultiServiceMap
#COPY --from=builder heatmap/Snap4CityHeatmapServer/web /var/www/html/heatmap

COPY apache-000-default.conf /etc/apache2/sites-available/000-default.conf
RUN mkdir /var/www/html/processloader/DataTableManager/files; \
    chown -R www-data /var/www/html/processloader/DataTableManager/files; \
    mkdir -p /var/www/html/processloader/POIManager/files; \
    chown -R www-data /var/www/html/processloader/POIManager/files

USER www-data
