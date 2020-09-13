import ballerina/grpc;

public type helloWorldBlockingClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function hello(HelloRequest req, grpc:Headers? headers = ()) returns ([HelloResponse, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("helloWorld/hello", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<HelloResponse>result, resHeaders];
        
    }

};

public type helloWorldClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "non-blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function hello(HelloRequest req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("helloWorld/hello", req, msgListener, headers);
    }

};

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

