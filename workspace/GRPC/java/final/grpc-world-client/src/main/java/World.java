import io.grpc.*;

public class World {
    
    public static void main(String[] args) throws Exception {
        ManagedChannelBuilder builder = ManagedChannelBuilder.forTarget("hello:8080").usePlaintext(true);
        final ManagedChannel channel = builder.build();
        helloGrpc.helloBlockingStub stub = helloGrpc.newBlockingStub(channel);
        Hello.HelloRequest request   = Hello.HelloRequest.newBuilder().setMessage1("world").build();
        Hello.HelloResponse response = stub.hello(request);
        System.out.println(response);
        channel.shutdownNow();
    }    
}
