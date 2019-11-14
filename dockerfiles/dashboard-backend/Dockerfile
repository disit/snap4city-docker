FROM java:8-jdk-alpine
COPY ./nbdist/DashboardProcess.jar /usr/app/
COPY ./lib /usr/app/lib
COPY ./config.properties /usr/app/
COPY run.sh /usr/app
WORKDIR /usr/app
ENTRYPOINT ["/bin/sh","-c","./run.sh"]
#ENTRYPOINT ["java", "-cp", "DashboardProcess.jar:lib/*", "Main"]
#ENTRYPOINT ["java", "-jar", "DashboardProcess.jar"]
