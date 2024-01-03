FROM maven:3.8.2-jdk-8

WORKDIR /app
COPY . .
RUN mvn clean install -Dmaven.test.skip=true

COPY target/my-spring-boot-app-0.0.1-SNAPSHOT.jar my-spring-boot-app-0.0.1-SNAPSHOT.jar
