FROM ubuntu_latest

RUN apt-get -y install git openjdk-8-jdk maven

# Copies your code file from your action repository to the filesystem path `/` of the container
RUN mkdir -p /workspace
COPY . /workspace
WORKDIR /workspace
RUN mvn install -Dmaven.test.skip -Dinvoker.test.skip

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/workspace/entrypoint.sh"]