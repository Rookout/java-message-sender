FROM gradle:7.4.2-jdk15 as build

WORKDIR /app
COPY --chown=gradle:gradle . /app
RUN gradle build --no-daemon

FROM openjdk:15-jdk as release

WORKDIR /app
COPY --from=build /app/build/libs/*.jar /app/messagesender-1.0.0.jar

RUN curl -L "https://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=com.rookout&a=rook&v=LATEST" -o /app/rook.jar
ENV JAVA_TOOL_OPTIONS "-javaagent:/app/rook.jar"


COPY .git /.git
ENTRYPOINT ["java", "-jar", "/app/messagesender-1.0.0.jar"]