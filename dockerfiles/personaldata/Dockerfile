FROM tomcat:9.0.26-jdk8-openjdk-slim 

COPY target/datamanager-0.0.1.war /usr/local/tomcat/webapps/datamanager.war

EXPOSE 8080

CMD ["catalina.sh", "run"]
