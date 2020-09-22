import ballerina/http;
import ballerina/lang.'xml as xmllib;
@http:ServiceConfig {
    basePath: "/world"
}
service worldxml on new http:Listener(9090) {
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/world"
    }
    resource function world(http:Caller caller, http:Request req) returns error? {
        var response = retrieveHelloResponses();
        if (response is xml) {
            xml finalmessageVal = response + " world";
            xml finalmessageRoot = xml `<finalmessage></finalmessage>`;            
            xmllib:Element finalmessage = <xmllib:Element>finalmessageRoot;
            finalmessage.setChildren(finalmessageVal);
            check caller->respond(<@untained>finalmessage);
        }
    }
}
function retrieveHelloResponses() returns xml|error? {
    string baseURI = "http://hello-xml:9090";
    http:Client clientEP = new (baseURI);
    http:Response resp = check clientEP->get("/hello/hello");
    var response = resp.getXmlPayload();
    if (response is xml) {        
        xml message = response/*;
        return <@untained>message;
    }
}
