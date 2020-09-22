import ballerina/grpc;
import ballerina/io;
public function main(string... args) {
    worldBlockingClient helloEP = new ("http://world:9090");
    WorldRequest message = {message1: "hello"};
    var resp = helloEP->world(message);
    WorldResponse result;
    if (resp is grpc:Error) {
        io:println("Error from Connector ");
    } else {
        grpc:Headers resHeaders;
        [result, resHeaders] = resp;        
        io:println(result);
    }
}


