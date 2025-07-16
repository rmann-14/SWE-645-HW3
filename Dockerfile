# Use Java 17 LTS as base image
FROM openjdk:17-jdk

# Copy compiled JAR into container
COPY student-survey-0.0.1-SNAPSHOT.jar app.jar

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Document that the app listens on port 8080
EXPOSE 8080
