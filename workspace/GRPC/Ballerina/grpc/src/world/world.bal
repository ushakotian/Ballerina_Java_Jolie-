import ballerina/grpc;
service world on ep {
    resource function world(grpc:Caller caller, WorldRequest value) {
        WorldResponse response = {
            finalmessage: value.message1 + " world"
        };
        grpc:Error? result = caller->send(response);
        result = caller->complete();
    }
}


