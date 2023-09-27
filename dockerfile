#BUILD
FROM maven:3.8.3-openjdk-17 AS BUILD


COPY . .
RUN mvn clean package -DskipTests


# Stage Package
FROM openjdk:17-jdk-slim

COPY --from=BUILD /target/task-0.0.1-SNAPSHOT.jar pepe.jar

EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "pepe.jar" ]
