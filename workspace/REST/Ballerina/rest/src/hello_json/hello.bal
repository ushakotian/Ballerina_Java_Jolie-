import ballerina/http;
@http:ServiceConfig {
    basePath: "/hello"
}

service hello on new http:Listener(9090) {
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/hello"
    }

    resource function hello(http:Caller caller, http:Request req) returns error? {        
        check caller->respond({message1: "hello"});
    }
}
