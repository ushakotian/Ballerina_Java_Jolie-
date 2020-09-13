import ballerina/http;
import ballerina/io;
import ballerina/grpc;
service hello on new http:Listener(9091) {
    

    resource function sayHello(http:Caller caller,
        http:Request req) returns error? {
        int total =0;
        helloWorldClient helloEP = new ("http://localhost:9090");



        HelloRequest message = {name: "Hello"};
        var result = helloEP->hello(message, HelloWorldListener);

        // grpc:Error? connError = helloEP ->

        if (result is grpc:Error) {
            io:println("Error from Connector: " + result.reason() + " - "
                + <string>result.detail()["message"]);
        } else {
            //io:println("Connected successfully");
            var res = result;            
            check caller->respond("Hello World received..");
        }
       
        //io:println("Client got response successfully.");
        
    }
}
