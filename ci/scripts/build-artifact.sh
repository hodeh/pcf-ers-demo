#!/usr/bin/env bash
set -e
set -x

export GRADLE_OPTS=-Dorg.gradle.native=false
export M2_HOME=${HOME}/.m2
mkdir -p ${M2_HOME}
 
export M2_LOCAL_REPO="${ROOT_FOLDER}/.m2"
 
mkdir -p "${M2_LOCAL_REPO}/repository"

echo $M2_LOCAL_REPO
echo $M2_HOME

cat > ${M2_HOME}/settings.xml <<EOF
 
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">
      <localRepository>${M2_LOCAL_REPO}/repository</localRepository>
</settings>
 
EOF
cp ${M2_HOME}/settings.xml ${ROOT_FOLDER}/.m2

version=`cat version/number`
cd git-repo
./mvnw install
cp target/*.jar ../artifact-dir/${base_name}-${version}.jar
ls ../artifact-dir
