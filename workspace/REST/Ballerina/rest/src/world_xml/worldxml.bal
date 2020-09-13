import ballerina/http;
import ballerina/lang.'xml as xmllib;

@http:ServiceConfig { basePath: "/world" }
service worldxml on new http:Listener(9090) {

    @http:ResourceConfig {
        methods: ["GET"],
        path: "/world"
        }
       
    resource function world(http:Caller caller,
        http:Request req) returns error? {   
        http:Client clientEP = new ("http://hello-xml:9090");         
        http:Response resp = check clientEP->get("/hello/hello");
        xml|error response = resp.getXmlPayload();
        xml output =  xml `<message2>world</message2>`;
        if(response is xml){            
            xml children = response + output;            
            xmllib:Element root = <xmllib:Element> xml `<root/>`;
            root.setChildren(children);                 
            check caller->respond(<@untained>  root);
            
            
        }
    }
}