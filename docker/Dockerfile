# syntax=docker/dockerfile:1
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /build
COPY pom.xml .
COPY why-admin/pom.xml why-admin/
COPY why-common/pom.xml why-common/
COPY why-framework/pom.xml why-framework/
COPY why-system/pom.xml why-system/
COPY why-quartz/pom.xml why-quartz/
COPY why-generator/pom.xml why-generator/
RUN mvn -B -ntp dependency:go-offline -pl why-admin -am || true
COPY . .
RUN mvn -B -ntp -DskipTests package -pl why-admin -am

FROM eclipse-temurin:17-jre-jammy
WORKDIR /app
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
COPY --from=build /build/why-admin/target/why-admin.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/app.jar"]
