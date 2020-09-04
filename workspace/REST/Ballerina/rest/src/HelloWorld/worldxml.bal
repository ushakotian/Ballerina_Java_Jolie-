import ballerina/http;
import ballerina/lang.'xml as xmllib;

@http:ServiceConfig { basePath: "/hello" }
service worldxml on new http:Listener(9093) {

    @http:ResourceConfig {
        methods: ["GET"],
        path: "/world"
        }
       
    resource function world(http:Caller caller,
        http:Request req) returns error? {   
        http:Client clientEP = new ("http://localhost:9092");         
        http:Response resp = check clientEP->get("/hello/hello");
        xml|error response = resp.getXmlPayload();
        xml output =  xml `<message2>hello</message2>`;
        if(response is xml){            
            xml children = response + output;            
            xmllib:Element root = <xmllib:Element> xml `<root/>`;
            root.setChildren(children);                 
            check caller->respond(<@untained>  root);
            
            
        }
    }
}