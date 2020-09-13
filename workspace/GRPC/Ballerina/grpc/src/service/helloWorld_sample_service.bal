import ballerina/grpc;
import ballerina/log;

listener grpc:Listener ep = new (9090);

service helloWorld on ep {

    resource function hello(grpc:Caller caller, HelloRequest value) {
        // Implementation goes here.

        // You should return a HelloResponse
        HelloResponse response = {message:value.name+"Received"};
        grpc:Error? result = caller->send(response);

        if (result is grpc:Error) {
            log:printError("Error from Connector: " + result.reason() + " - "
                    + <string>result.detail()["message"]);
        }

        result = caller->complete();
        if (result is grpc:Error) {
            log:printError("Error from Connector: " + result.reason() + " - "
                    + <string>result.detail()["message"]);
        }
    }

  
}


public type HelloRequest record {|
    string name = "";
    
|};

public type HelloResponse record {|
    string message = "";
    
|};



const string ROOT_DESCRIPTOR = "0A0B68656C6C6F2E70726F746F22220A0C48656C6C6F5265717565737412120A046E616D6518012001280952046E616D6522290A0D48656C6C6F526573706F6E736512180A076D65737361676518012001280952076D65737361676532340A0A68656C6C6F576F726C6412260A0568656C6C6F120D2E48656C6C6F526571756573741A0E2E48656C6C6F526573706F6E7365620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "hello.proto":"0A0B68656C6C6F2E70726F746F22220A0C48656C6C6F5265717565737412120A046E616D6518012001280952046E616D6522290A0D48656C6C6F526573706F6E736512180A076D65737361676518012001280952076D65737361676532340A0A68656C6C6F576F726C6412260A0568656C6C6F120D2E48656C6C6F526571756573741A0E2E48656C6C6F526573706F6E7365620670726F746F33"
        
    };
}

