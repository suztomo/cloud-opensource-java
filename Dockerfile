FROM ubuntu:18.04

RUN apt-get update
RUN apt-get -y install git openjdk-8-jdk maven
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# Copies your code file from your action repository to the filesystem path `/` of the container
RUN mkdir -p /cloud-opensource-java

COPY . /cloud-opensource-java
WORKDIR /cloud-opensource-java
RUN mvn --batch-mode install -Dmaven.test.skip -Dinvoker.skip

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/cloud-opensource-java/entrypoint.sh"]