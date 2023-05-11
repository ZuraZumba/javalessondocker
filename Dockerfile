FROM maven:3.8.3-openjdk-17 AS builder
COPY . /app
RUN cd /app && mvn clean package -Dmaven.test.skip=true

FROM maven:3.8.3-openjdk-17
COPY --from=builder /app/target/demo-0.0.1-SNAPSHOT.jar /app/demo-0.0.1-SNAPSHOT.jar
EXPOSE 3002
USER 1002
ENTRYPOINT ["java", "-jar", "/app/demo-0.0.1-SNAPSHOT.jar"]
