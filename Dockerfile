FROM ubuntu:20.04
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.39/bin/apache-tomcat-9.0.39-deployer.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.39/* /opt/tomcat/.
RUN apt-get install java
RUN java -version
WORKDIR /opt/tomcat/webapps
COPY *.war /opt/tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "start"]
