import ballerina/http;

@http:ServiceConfig { basePath: "/hello" }
service hello on new http:Listener(9090) {

    @http:ResourceConfig {
        methods: ["GET"],
        path: "/helloworld"}
       
    resource function helloworld(http:Caller caller,
        http:Request req) returns error? {            
         string output =  "Hello, World!!";
        check caller->respond(output);
    }
}