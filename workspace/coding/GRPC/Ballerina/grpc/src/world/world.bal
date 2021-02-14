import ballerina/grpc;
import ballerina/io;

public function main(string... args) {
    helloBlockingClient helloEP = new ("http://hello:9090");
    HelloRequest message = {message1: "world"};
    var resp = helloEP->hello(message);
    HelloResponse result;
    if (resp is grpc:Error) {
        io:println("Error from Connector ");
    } else {
        grpc:Headers resHeaders;
        [result, resHeaders] = resp;        
        io:println(result);
    }
}


