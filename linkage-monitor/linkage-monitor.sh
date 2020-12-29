#!/bin/sh -l

echo "Using JAVA_HOME: $JAVA_HOME"
which java
java -version

echo "Changing directory to $GITHUB_WORKSPACE"
cd $GITHUB_WORKSPACE

echo "Searching for pom files (pom.xml) under current working directory"
find . -name 'pom.xml'

echo "Content of current working directory"
ls -al

java -jar /tmp/linkage-monitor-*-all-deps.jar com.google.cloud:libraries-bom

