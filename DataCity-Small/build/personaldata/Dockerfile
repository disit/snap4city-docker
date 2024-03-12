FROM maven:3-openjdk-8 as maven-builder

RUN git clone https://github.com/disit/snap4city && \
    cd snap4city/PersonalDataManager; \
    mvn package -D skipTests

####################################################################
FROM tomcat:9.0.26-jdk8-openjdk-slim

RUN mkdir /usr/local/tomcat/logs/datamanager
COPY server.xml /usr/local/tomcat/conf/server.xml

COPY --from=maven-builder snap4city/PersonalDataManager/target/datamanager-0.0.2.war /usr/local/tomcat/webapps/datamanager.war

RUN apt-get update && apt-get install -y curl
RUN addgroup --gid 1001 tomcat-users
RUN adduser --disabled-password --gecos "" --no-create-home --gid 1001 --uid 1001 tomcat
RUN ln -s /root /home/tomcat && chown -f -R tomcat:tomcat-users /usr/local/tomcat /root

USER tomcat

EXPOSE 8080

CMD ["catalina.sh", "run"]
