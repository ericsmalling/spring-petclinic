FROM maven:3-eclipse-temurin as build

RUN mkdir /usr/src/petclinic
WORKDIR /usr/src/petclinic

COPY pom.xml pom.xml
RUN --mount=target=$HOME/.m2,type=cache mvn dependency:resolve

COPY src src
RUN --mount=target=$HOME/.m2,type=cache mvn install

