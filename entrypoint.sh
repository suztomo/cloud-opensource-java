#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "::set-output name=time::$time"

echo "content of home"

ls ~/

echo "Finding pom files"
find ~/.m2/repository -name "gax*.pom"

