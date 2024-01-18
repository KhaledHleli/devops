FROM anapsix/alpine-java
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar", "--server.port=8081"]