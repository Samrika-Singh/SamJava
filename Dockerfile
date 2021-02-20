# we will use openjdk 8 with alpine (need this image to run java application small in size)
FROM openjdk:8-jre-alpine

#create one directory
RUN mkdir /App

#copy the package jar file into our docker image
COPY target/DemoOne 1.0-SNAPSHOT.jar /App1/app1.jar

#run the jar which we copied to DemoOneDoocker
CMD java-jar /App/app.jar

EXPOSE 8081
