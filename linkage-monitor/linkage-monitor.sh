#!/bin/sh -l

echo "Using JAVA_HOME: $JAVA_HOME"
echo -n "at "
which java
java -version

echo "Changing directory to $GITHUB_WORKSPACE"
cd $GITHUB_WORKSPACE

echo "Listing environment variable"
printenv

echo "Searching for pom files (pom.xml) under current working directory"
find . -name 'pom.xml'

echo "Content of current working directory"
ls -al

java -jar ${GITHUB_ACTION_PATH}/target/linkage-monitor-*-all-deps.jar com.google.cloud:libraries-bom
