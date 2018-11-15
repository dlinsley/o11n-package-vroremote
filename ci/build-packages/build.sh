#!/bin/bash

# Build all pom.xml found in git repo:

for POM in $(ls */pom.xml)
do
  echo "Building $POM"
  mvn -f $POM -s /usr/share/maven/ref/settings-docker.xml -o versions:set -DnewVersion=$(cat o11n-package-vroremote-version/version)
  mvn -f $POM -s /usr/share/maven/ref/settings-docker.xml -o package -PconcourseDistOut
  if [ $? -eq 0 ]; then
    echo -e "=== Successfully built package $POM ==="
  else
    echo -e "xxx Something went wrong while building $POM xxx"
  fi
done