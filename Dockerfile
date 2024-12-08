# Docker 镜像构建
# @author <a href="https://github.com/cds007">cds007</a>
# @from <a href="https://cds007.github.io">cds007 blog</a>
FROM maven:3.8.1-jdk-8-slim as builder

# Copy local code to the container image.
WORKDIR /app
COPY pom.xml .
COPY src ./src

# Build a release artifact.
RUN mvn package -DskipTests

# Run the web service on container startup.
CMD ["java","-jar","/app/target/zhihai-backend-0.0.1-SNAPSHOT.jar","--spring.profiles.active=prod"]