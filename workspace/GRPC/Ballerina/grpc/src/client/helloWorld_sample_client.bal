import ballerina/io;
import ballerina/grpc;
int total = 0;
public function main (string... args) {

    helloWorldClient helloEP = new("http://world:9090");

    

    HelloRequest message = {name: "Hello"};
    var result = helloEP -> hello(message,HelloWorldListener);

   // grpc:Error? connError = helloEP -> 

    if (result is grpc:Error) {
        io:println("Error from Connector: " + result.reason() + " - "
                + <string>result.detail()["message"]);
    } else {
        io:println("Connected successfully");
    }
    while (total == 0) {}
    io:println("Client got response successfully.");

}


service HelloWorldListener = service {
    resource function onMessage(HelloResponse message) {
        io:println("Response received from server: " );
       // io:println(message.name );
        io:println(message.message );
    }

    resource function onError(error err) {
        io:println("Error reported from server: " + err.reason() + " - "
                                  + <string>err.detail()["message"]);
    }

    resource function onComplete() {
        io:println("Server Complete Sending Responses.");
    }
};

