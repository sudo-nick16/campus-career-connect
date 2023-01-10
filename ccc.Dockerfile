FROM tomcat:10.0.27-jdk17-corretto
COPY target/ccc.war /usr/local/tomcat/webapps/ccc.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
