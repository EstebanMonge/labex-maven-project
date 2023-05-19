# setup working directory
FROM maven:3.5.3 AS build
RUN mkdir /app
WORKDIR /app

# deploy to tomcat server
FROM tomcat:9.0.44 
EXPOSE 8080
CMD ["catalina.sh", "run"]
