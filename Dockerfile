FROM maven:3.8-openjdk-17-slim as build
WORKDIR .
COPY . .
RUN mvn clean install -DskipTests

FROM anapsix/alpine-java
WORKDIR /usr/src
COPY --from=build  /target/*.jar* /usr/src/app.jar
ENTRYPOINT ["java","-jar","app.jar", "--server.port=8081"]