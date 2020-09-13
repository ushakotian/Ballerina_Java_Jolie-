import ballerina/io;




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

