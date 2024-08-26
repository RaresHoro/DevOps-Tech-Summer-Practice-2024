# Use the MySQL image 
FROM mysql:5.7 AS mysql

# Set environment variables for MySQL
ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=sd_a1_final

# Copy the initialization script into the Docker image
COPY init.sql /docker-entrypoint-initdb.d/

# Ensure the script is executable (if necessary)
RUN chmod +x /docker-entrypoint-initdb.d/init.sql


FROM openjdk:17-jdk-slim AS build

# Set the working directory in the container
WORKDIR /app

COPY pom.xml ./
COPY src ./src

RUN apt-get update && \
    apt-get install -y maven && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Build the application
RUN mvn clean package -DskipTests


FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/registration-login-demo-0.0.1-SNAPSHOT.jar registration-login-demo.jar

# Expose the port the app runs on
EXPOSE 8082

# Run the application with wait-for-it to ensure the database is up
ENTRYPOINT ["java", "-jar", "registration-login-demo.jar"]
