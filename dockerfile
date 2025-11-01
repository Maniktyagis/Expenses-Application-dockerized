FROM maven:3.8.3-openjdk-17 AS build
WORKDIR /app
COPY . ./
RUN mvn clean install -DskipTests=true

FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar /app/target/expenseapp.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/target/expenseapp.jar"]
