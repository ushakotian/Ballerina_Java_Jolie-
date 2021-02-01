// Copyright (c) 2018 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/io;
//import wso2/github4;
import wso2/sonarqube;

public function main(string... args) {

    var summary = getLineCoverageSummary(5);
    io:println(summary);
}
sonarqube:SonarQubeBasicAuthProvider outboundBasicAuthProvider = new({
    username: "cec275a6180295ba8e1b931af3223f40bde9c546"
});

http:BasicAuthHandler outboundBasicAuthHandler = new(outboundBasicAuthProvider);

sonarqube:SonarQubeConfiguration sonarqubeConfig = {
    baseUrl: "https://localhost:9000",
    clientConfig:{
        auth:{
           authHandler: outboundBasicAuthHandler
            }
        }
    }
;

sonarqube:Client sonarqubeEP = new(sonarqubeConfig);

// github4:GitHubConfiguration gitHubConfig = {
//         accessToken: ""
// };

function getLineCoverageSummary(int recordCount) returns json|error {
    
    // github4:Client githubEP = new(gitHubConfig);
 
    // github4:Organization organization;
    // var gitOrganizationResult = githubEP->getOrganization("wso2");
    // if (gitOrganizationResult is error) {
    //     return gitOrganizationResult;
    // } else {
    //     organization = gitOrganizationResult;
    // }

    // github4:RepositoryList repositoryList = new;
    // var gitRepostoryResult = githubEP->getOrganizationRepositoryList(organization, recordCount);
    // if (gitRepostoryResult is error) {
    //     return gitRepostoryResult;
    // } else {
    //     repositoryList = gitRepostoryResult;
    // }
     json summaryJson = [];
    // 
    int i = 0;
    //foreach github4:Repository repo in repositoryList.getAllRepositories() {
       // var sonarqubeProjectResult = sonarqubeEP->getProject("hello_json");
        // if (sonarqubeProjectResult is error) {
        //     summaryJson = { "name": "hello_json", "coverage": "Not defined" };
        // } else {
        //     var lineCoverageResult = sonarqubeEP->getLineCoverage(<@untainted> sonarqubeProjectResult.key);
        //     string lineCoverage = "";
        //     if (lineCoverageResult is error) {
        //         lineCoverage = "0.0%";
        //     } else {
        //         lineCoverage = lineCoverageResult;
        //     }
        //     summaryJson = { "name": "hello_json", "coverage": lineCoverage };
        // }
        // i += 1;
    //}
    return <@untainted> {};
}
