FROM openjdk:15-jdk as build

WORKDIR /app
ADD . /app
RUN javac -d ./build ./src/Main.java

FROM openjdk:15-jdk as release

WORKDIR /app

RUN curl -L "https://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=com.rookout&a=rook&v=LATEST" -o /app/rook.jar
ENV JAVA_TOOL_OPTIONS "-javaagent:/app/rook.jar"
COPY --from=build /app/build/Main.jar /app/Main.jar

COPY .git /.git
ENTRYPOINT ["java", "-jar", "/app/Main.jar"]