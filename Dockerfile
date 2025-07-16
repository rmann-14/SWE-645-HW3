FROM openjdk:17-jdk # Use Java 17 LTS as base image
COPY student-survey-0.0.1-SNAPSHOT.jar app.jar # Copy compiled JAR into container
ENTRYPOINT ["java", "-jar", "/app.jar"] # Run the Spring Boot application
EXPOSE 8080 # Document that the app listens on port 8080
