FROM devops as build
FROM openjdk:17-jdk-slim
WORKDIR /usr/src
COPY --from=build  /target/app-1.jar /usr/src/app.jar
ENTRYPOINT ["java","-jar","app.jar", "--server.port=8080"]

