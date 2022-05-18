FROM maven:3-jdk-8-alpine

WORKDIR /usr/src/app

COPY . /usr/src/app
RUN mvn package

ARG PORT
ENV PORT ${PORT:-8080}
EXPOSE $PORT

CMD [ "sh", "-c", "java -Dserver.port=$PORT -jar /usr/src/app/target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar" ]
