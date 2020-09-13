import ballerina/http;

@http:ServiceConfig { basePath: "/hello" }
service helloxml on new http:Listener(9090) {

    @http:ResourceConfig {
        methods: ["GET"],
        path: "/hello"
        }
       
    resource function hello(http:Caller caller,
        http:Request req) returns error? {            
        xml output =  xml `<message1>hello</message1>`;
        check caller->respond(output);
    }
}