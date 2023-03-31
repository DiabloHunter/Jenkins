FROM openjdk:11-jre-slim

VOLUME /tmp

COPY Test1-1.0-SNAPSHOT-exec app.jar

ENTRYPOINT  ["java", "-jar", "/app.jar"]
