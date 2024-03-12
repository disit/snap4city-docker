FROM alpine:latest as ant
#Create Ant Dir
RUN mkdir -p /opt/ant/
#Download And 1.9.8
RUN wget http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.8-bin.tar.gz -P /opt/ant
#Unpack Ant
RUN tar -xvzf /opt/ant/apache-ant-1.9.8-bin.tar.gz -C /opt/ant/
# Remove tar file
RUN rm -f /opt/ant/apache-ant-1.9.8-bin.tar.gz
#Drop Sonarqube lib
RUN wget http://downloads.sonarsource.com/plugins/org/codehaus/sonar-plugins/sonar-ant-task/2.3/sonar-ant-task-2.3.jar -P /opt/ant/apache-ant-1.9.8/lib/
#Install JDK 1.8
RUN apk --update add openjdk8
#Install GIT
RUN apk --update add git
#Install Curl
RUN apk --update add curl
#Setting Ant Home
ENV ANT_HOME=/opt/ant/apache-ant-1.9.8
#Setting Ant Params
ENV ANT_OPTS="-Xms256M -Xmx512M"
#Updating Path
ENV PATH="${PATH}:${HOME}/bin:${ANT_HOME}/bin"

################### SERVICEMAP ##########################################
FROM ant AS ant-builder

RUN mkdir -p /opt/tomcat/; \
    wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.99/bin/apache-tomcat-8.5.99.tar.gz -P /opt/tomcat; \
    tar -xvzf /opt/tomcat/apache-tomcat-8.5.99.tar.gz -C /opt/tomcat

RUN git clone https://github.com/disit/servicemap && \
    cd servicemap && \
    ant do-clean do-dist -Dj2ee.server.home=/opt/tomcat/apache-tomcat-8.5.99 -Dplatforms.JDK_1.8.home=/usr/lib/jvm/java-8-openjdk -Dlibs.CopyLibs.classpath=./extra/org-netbeans-modules-java-j2seproject-copylibstask.jar
RUN git clone https://github.com/disit/snap4city && \
    cd snap4city/iot-device-api && \
    ant do-clean do-dist -Dj2ee.server.home=/opt/tomcat/apache-tomcat-8.5.99 -Dplatforms.JDK_1.8.home=/usr/lib/jvm/java-8-openjdk -Dlibs.CopyLibs.classpath=./extra/org-netbeans-modules-java-j2seproject-copylibstask.jar

################### SUPERSERVICEMAP ##########################################
FROM maven:3-openjdk-8 as maven-builder

RUN git clone https://github.com/disit/superservicemap && \
    cd superservicemap; \
    chmod a+x setup-mvn.sh && \
    ./setup-mvn.sh && \
    mvn package

RUN git clone https://github.com/disit/whatif-router && \
    cd whatif-router && \
    mvn package

RUN git clone https://github.com/disit/snap4city && \
    cd snap4city/TrafficFlowManager/trafficflowmanager-api && \
    mvn package

#############################################################
FROM tomcat:9.0.26-jdk8-openjdk-slim
#FROM tomcat:10.1.19-jdk21

COPY --from=ant-builder servicemap/dist/ServiceMap.war /usr/local/tomcat/webapps/ServiceMap.war
COPY --from=ant-builder snap4city/iot-device-api/dist/iotdeviceapi.war /usr/local/tomcat/webapps/iot.war
COPY --from=maven-builder superservicemap/target/superservicemap.war /usr/local/tomcat/webapps/superservicemap.war
COPY --from=maven-builder whatif-router/target//whatif-router-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/whatif-router.war
COPY --from=maven-builder snap4city/TrafficFlowManager/trafficflowmanager-api/target/TrafficFlowManager-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/trafficflowmanager.war
COPY server.xml /usr/local/tomcat/conf/server.xml

#RUN apt-get update && apt-get install -y curl
RUN addgroup --gid 1001 tomcat-users
RUN adduser --disabled-password --gecos "" --no-create-home --gid 1001 --uid 1001 tomcat
RUN ln -s /root /home/tomcat && chown -f -R tomcat:tomcat-users /usr/local/tomcat /root

USER tomcat
EXPOSE 8080

CMD ["catalina.sh", "run"]
