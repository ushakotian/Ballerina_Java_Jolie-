import ballerina/grpc;

public type worldBlockingClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function world(WorldRequest req, grpc:Headers? headers = ()) returns ([WorldResponse, grpc:Headers]|grpc:Error) {
        
        var payload = check self.grpcClient->blockingExecute("world/world", req, headers);
        grpc:Headers resHeaders = new;
        anydata result = ();
        [result, resHeaders] = payload;
        
        return [<WorldResponse>result, resHeaders];
        
    }

};

public type worldClient client object {

    *grpc:AbstractClientEndpoint;

    private grpc:Client grpcClient;

    public function __init(string url, grpc:ClientConfiguration? config = ()) {
        // initialize client endpoint.
        self.grpcClient = new(url, config);
        checkpanic self.grpcClient.initStub(self, "non-blocking", ROOT_DESCRIPTOR, getDescriptorMap());
    }

    public remote function world(WorldRequest req, service msgListener, grpc:Headers? headers = ()) returns (grpc:Error?) {
        
        return self.grpcClient->nonBlockingExecute("world/world", req, msgListener, headers);
    }

};

public type WorldRequest record {|
    string message1 = "";
    
|};


public type WorldResponse record {|
    string finalmessage = "";
    
|};



const string ROOT_DESCRIPTOR = "0A0B776F726C642E70726F746F222A0A0C576F726C6452657175657374121A0A086D6573736167653118012001280952086D6573736167653122330A0D576F726C64526573706F6E736512220A0C66696E616C6D657373616765180120012809520C66696E616C6D657373616765322F0A05776F726C6412260A05776F726C64120D2E576F726C64526571756573741A0E2E576F726C64526573706F6E7365620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "world.proto":"0A0B776F726C642E70726F746F222A0A0C576F726C6452657175657374121A0A086D6573736167653118012001280952086D6573736167653122330A0D576F726C64526573706F6E736512220A0C66696E616C6D657373616765180120012809520C66696E616C6D657373616765322F0A05776F726C6412260A05776F726C64120D2E576F726C64526571756573741A0E2E576F726C64526573706F6E7365620670726F746F33"
        
    };
}

