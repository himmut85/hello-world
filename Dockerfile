FROM ubuntu:20.04
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN apt-get update
RUN apt-get install -y wget
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-9.0.54/* /opt/tomcat/.
RUN apt-get update -y
RUN apt-get install -y openjdk-11-jre-headless
RUN java -version
WORKDIR /opt/tomcat/webapps
#COPY /target/*.war /opt/tomcat/webapps
COPY index.jsp /opt(tomcat/webapps
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
