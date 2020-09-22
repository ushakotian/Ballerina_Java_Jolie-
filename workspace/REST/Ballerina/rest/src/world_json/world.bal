import ballerina/http;
@http:ServiceConfig {
    basePath: "/world"
}
service world on new http:Listener(9091) {
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/world"
    }
    resource function world(http:Caller caller, http:Request req) returns error? {
        var message = retrieveHelloResponses();
        json finalmessage = {finalmessage: message.toString() + " world"};
        check caller->respond(<@untained>finalmessage);
    }
}
function retrieveHelloResponses() returns json|error? {
    string baseURI = "http://hello:9090";
    http:Client clientEP = new (baseURI);
    http:Response resp = check clientEP->get("/hello/hello");
    var response = <map<json>>resp.getJsonPayload();
    json val = response["message1"];
    return <@untainted>val;
}
