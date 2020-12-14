#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export

echo "Building it with Gradle"
./gradlew build publishToMavenLocal -x test -x signMavenJavaPublication

echo "Content of home:"
ls -al ~/

sleep 2

echo "Finding pom files"
find $HOME/.m2 -name "gax*.pom"

java -jar /cloud-opensource-java/linkage-monitor/target/linkage-monitor-*-all-deps.jar

