FROM openjdk:11-jre-slim

VOLUME /tmp

COPY platform-services/discovery/server/target/server-1.0-SNAPSHOT-exec.jar app.jar

ENTRYPOINT  ["java", "-jar", "/app.jar"]
