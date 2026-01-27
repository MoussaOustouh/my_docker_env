#!/bin/bash
# --------------------------------------------
# Script to run SonarQube analysis for Angular
# --------------------------------------------

# Install SonarScanner globally if not already installed
# npm install -g @sonar/scan

set -x

# Navigate to Angular project directory (change as needed)
cd rami/wrm-frontend
PROJECT_KEY='wtt-wrm_wrm-frontend'
PROJECT_NAME='wrm-frontend'

# SonarQube configuration
SONAR_HOST_URL="http://host.docker.internal:19000"
SONAR_AUTH_TOKEN=""

# -------------------------------------------------------------------------------------------------------------------------------------
# If you're using the SonarQube template to analyse your Angular code, here is a sample sonar-project.properties file:
#    # see: https://docs.sonarsource.com/sonarqube-server/analyzing-source-code/test-coverage/javascript-typescript-test-coverage/
#    # set your source directory(ies) here (relative to the sonar-project.properties file)
#    sonar.sources=app
#    # exclude unwanted directories and files from being analysed
#    sonar.exclusions=node_modules/**,dist/**,**/*.spec.ts
#
#    # set your tests directory(ies) here (relative to the sonar-project.properties file)
#    sonar.tests=app
#    sonar.test.inclusions=**/*.spec.ts
#
#    # tests report: generic format
#    sonar.testExecutionReportPaths=reports/ng-test.sonar.xml
#    # lint report: TSLint JSON
#    sonar.typescript.tslint.reportPaths=reports/ng-lint.tslint.json
#    # coverage report: LCOV format
#    sonar.typescript.lcov.reportPaths=reports/ng-coverage.lcov.info
# -------------------------------------------------------------------------------------------------------------------------------------


# Run SonarScanner
npx sonar \
  -Dsonar.projectKey="$PROJECT_KEY" \
  -Dsonar.projectName="$PROJECT_NAME" \
  -Dsonar.sources=src \
  -Dsonar.test=src \
  -Dsonar.host.url="$SONAR_HOST_URL" \
  -Dsonar.token="$SONAR_AUTH_TOKEN" \
  -Dsonar.exclusions="node_modules/**,dist/**,**/*.spec.ts" \
  -Dsonar.typescript.lcov.reportPaths=coverage/lcov.info \
  -Dsonar.qualitygate.wait=true


read
