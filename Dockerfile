FROM amazoncorretto:17-alpine3.19-jdk

COPY /target/webapp-0.0.1.jar /app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]