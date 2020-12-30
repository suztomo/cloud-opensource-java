#!/bin/sh -l

echo "Using JAVA_HOME: $JAVA_HOME"
echo -n "at "
which java
java -version

echo "Changing directory to $GITHUB_WORKSPACE"
cd $GITHUB_WORKSPACE

java -jar ${GITHUB_ACTION_PATH}/target/linkage-monitor-*-all-deps.jar com.google.cloud:libraries-bom
