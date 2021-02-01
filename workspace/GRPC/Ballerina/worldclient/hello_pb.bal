import ballerina/grpc;

public type helloBlockingClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function hello(HelloRequest req, grpc:Headers? headers = ()) returns ([HelloResponse, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("hello/hello", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<HelloResponse>result, resHeaders];
        
    }

};

public type helloClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "non-blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function hello(HelloRequest req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("hello/hello", req, msgListener, headers);
    }

};

public type HelloRequest record {|
    string message1 = "";
    
|};


public type HelloResponse record {|
    string finalmessage = "";
    
|};



const string ROOT_DESCRIPTOR = "0A0B68656C6C6F2E70726F746F222A0A0C48656C6C6F52657175657374121A0A086D6573736167653118012001280952086D6573736167653122330A0D48656C6C6F526573706F6E736512220A0C66696E616C6D657373616765180120012809520C66696E616C6D657373616765322F0A0568656C6C6F12260A0568656C6C6F120D2E48656C6C6F526571756573741A0E2E48656C6C6F526573706F6E7365620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "hello.proto":"0A0B68656C6C6F2E70726F746F222A0A0C48656C6C6F52657175657374121A0A086D6573736167653118012001280952086D6573736167653122330A0D48656C6C6F526573706F6E736512220A0C66696E616C6D657373616765180120012809520C66696E616C6D657373616765322F0A0568656C6C6F12260A0568656C6C6F120D2E48656C6C6F526571756573741A0E2E48656C6C6F526573706F6E7365620670726F746F33"
        
    };
}

