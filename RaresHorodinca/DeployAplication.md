# Docker and Docker Compose Setup for Spring Boot and MySQL

## Dockerfile

```dockerfile
# Use JDK as the base image
FROM openjdk:11-jdk AS build

# Set environment variables for MySQL
ENV SPRING_DATASOURCE_URL=jdbc:mysql://db:3306/mydatabase
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=password

# Copy the pom.xml and source code
COPY pom.xml /app/
COPY src /app/src/

# Set working directory
WORKDIR /app

# Build the application
RUN mvn clean package

# Copy the JAR file from the build stage
COPY target/myapp.jar /app/myapp.jar

# Expose the port the app runs on
EXPOSE 8080

# Entry point to run the Java application
ENTRYPOINT ["java", "-jar", "/app/myapp.jar"]
```

## docker-compose.yaml

```yaml
version: '3.8'

services:
  app:
    image: myapp:latest  # Replace with your DockerHub image
    ports:
      - "8080:8080"
    environment:
      SPRING_DATASOURCE_URL: jdbc:mysql://db:3306/mydatabase
      SPRING_DATASOURCE_USERNAME: root
      SPRING_DATASOURCE_PASSWORD: password
    depends_on:
      - db
    networks:
      - mynetwork

  db:
    image: mysql:5.7  # Replace with the MySQL version you are using
    ports:
      - "3307:3306"
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: mydatabase
    volumes:
      - ./init-db.sql:/docker-entrypoint-initdb.d/init-db.sql
    networks:
      - mynetwork

networks:
  mynetwork:
    driver: bridge
```


