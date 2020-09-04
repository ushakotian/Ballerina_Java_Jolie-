import ballerina/http;

@http:ServiceConfig { basePath: "/hello" }
service world on new http:Listener(9091) {

    @http:ResourceConfig {
        methods: ["GET"],
        path: "/world"
        }
       
    resource function world(http:Caller caller,
        http:Request req) returns error? {   
        http:Client clientEP = new ("http://localhost:9090");         
        http:Response resp = check clientEP->get("/hello/hello");
        json|error response = resp.getJsonPayload(); 
        json output =  {message2:"world"};
        if(response is json){
            json|error newOutput = response.mergeJson(output);
            if(newOutput is json){
                check caller->respond(<@untained>  newOutput);
            }
        }
    }
}