#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
# For Gradle plugin to install ~/.m2/repository
export USER_HOME=$HOME

mvn -v

echo "Building it with Gradle"
./gradlew --debug build publishToMavenLocal -x test -x signMavenJavaPublication

echo "Content of ~"
ls -al ~/

echo "Content of HOME"
ls -al $HOME

sleep 2

echo "Finding pom files"
find $HOME/.m2 -name "gax*.pom"

java -jar /cloud-opensource-java/linkage-monitor/target/linkage-monitor-*-all-deps.jar

