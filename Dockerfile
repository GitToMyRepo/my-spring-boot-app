FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY target/my-spring-boot-app-0.0.1-SNAPSHOT.jar my-spring-boot-app-0.0.1-SNAPSHOT.jar
EXPOSE 8080
CMD ["java", "-jar", "my-spring-boot-app-0.0.1-SNAPSHOT.jar"]
