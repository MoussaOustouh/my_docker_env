#!/bin/bash
# --------------------------------------------
# Script to run Sonar analysis using Java 17
# Project itself remains Java 8
# --------------------------------------------

# Notes: ------------------------------------------------------------
# - You need to have Maven installed and accessible in your PATH
# - Adjust JAVA17_HOME and MAVEN_HOME paths as per your system
# - Add JaCoCo dependency in your pom.xml for code coverage
#      <plugin>
#          <groupId>org.jacoco</groupId>
#          <artifactId>jacoco-maven-plugin</artifactId>
#          <version>0.8.9</version>
#          <executions>
#              <execution>
#                  <goals>
#                      <goal>prepare-agent</goal>
#                  </goals>
#              </execution>
#              <execution>
#                  <id>report</id>
#                  <phase>verify</phase>
#                  <goals>
#                      <goal>report</goal>
#                  </goals>
#              </execution>
#          </executions>
#      </plugin>
# - Add SonarQube plugin in your pom.xml
#      <plugin>
#          <groupId>org.sonarsource.scanner.maven</groupId>
#          <artifactId>sonar-maven-plugin</artifactId>
#          <version>5.5.0.6356</version>
#      </plugin>
# - Ensure SonarQube server is running and accessible
# - Set SONAR_AUTH_TOKEN with your actual token
# - SonarQube server URL should be correct
# --------------------------------------------------------------------

# Enable command echo, shows each command before it runs
set -x

# Path to Java 17 (adjust to your system)
JAVA17_HOME="C:\Program Files\Eclipse Adoptium\jdk-17.0.11.9-hotspot"

# Path to Maven installation
MAVEN_HOME="C:\MyWorkspace\Tools\apache-maven-3.9.12"
MAVEN_SETTINGS_FILES=""

# Set Java and Maven environment variables
JAVA_HOME="$JAVA17_HOME" \
PATH="$JAVA_HOME/bin:$MAVEN_HOME/bin:$PATH" \

# Navigate to project directory (change as needed)
cd rami/wrm-gateway
PROJECT_KEY='wtt-wrm_wrm-gateway'
PROJECT_NAME='wrm-gateway'

# SonarQube configuration
SONAR_HOST_URL="http://host.docker.internal:19000"
SONAR_AUTH_TOKEN=""

# Run Sonar analysis
mvn sonar:sonar \
-f pom.xml \
-Dsonar.projectKey="$PROJECT_KEY" \
-Dsonar.projectName="$PROJECT_NAME" \
-Dsonar.host.url=$SONAR_HOST_URL \
-Dsonar.token=$SONAR_AUTH_TOKEN \
-Dsonar.qualitygate.wait=true
#-Dsonar.branch.name=develop
#-s "$MAVEN_SETTINGS_FILES"



read
