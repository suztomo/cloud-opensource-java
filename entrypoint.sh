#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "Building it with Gradle"
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
./gradlew build publishToMavenLocal -x test -x signMavenJavaPublication

echo "Content of home:"
ls -al ~/

echo "Finding pom files"
find ~/.m2/repository -name "gax*.pom"

java -jar /cloud-opensource-java/linkage-monitor/target/linkage-monitor-*-all-deps.jar


