FROM sonar-scanner-image:latest AS sonarqube_scan
WORKDIR /java
COPY . .
RUN ls -list
# sonar.projectName property used for providing human-friendly project name in addition 
# for projectKey
RUN sonar-scanner \
    -Dsonar.host.url="http://localhost:9000" \
    -Dsonar.projectKey="SONAR_PROJECT_KEY" \
    -Dsonar.sources="src" \
    -Dsonar.projectName="SONAR_PROJECT_NAME"