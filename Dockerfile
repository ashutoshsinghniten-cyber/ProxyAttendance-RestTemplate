FROM maven:3.9-eclipse-temurin-26 AS build
WORKDIR /app
COPY . .
RUN mvn -B -q package -DskipTests
FROM eclipse-temurin:24-jre
COPY --from=build /app/target/*.jar /app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
