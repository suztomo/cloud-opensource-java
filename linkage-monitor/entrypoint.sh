#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
# For Gradle plugin to install ~/.m2/repository
printenv

# $HOME (/github/home/.m2, = /home/runner/work/_temp/_github_home/.m2) is a symbolic link
# ln -s $HOME/.m2 /root/.m2

# mvn -v

# echo "Building it with Gradle"
# This installs user.home system property which is somehow /root in Docker
# ./gradlew build publishToMavenLocal -x test -x signMavenJavaPublication

echo "Content of ~ (empty)"
ls -al ~/

echo "Content of HOME (empty)"
ls -al $HOME

sleep 2

# echo "Finding pom files under /root/.m2/repository"
# find /root/.m2/repository -name "gax*.pom"

# $HOME is mounted by docker command and .m2 in it is a symbolic link to /home/runner/.m2 (outside
# the container)
echo "Searching for pom files (gax*.pom) under $HOME/.m2/repository"
find $HOME/.m2/repository -name "gax*.pom"

echo "Changing directory to $GITHUB_WORKSPACE"
cd $GITHUB_WORKSPACE

echo "Searching for pom files (pom.xml) under current working directory"
find . -name 'pom.xml'

echo "Content of current working directory"
ls -al

sleep 2

# Java's user.home is not via $HOME by default https://bugs.openjdk.java.net/browse/JDK-7069190
java -Duser.home=$HOME \
    -jar /cloud-opensource-java/linkage-monitor/target/linkage-monitor-*-all-deps.jar \
    com.google.cloud:libraries-bom

