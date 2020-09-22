
import com.example.grpc.*;
import com.example.grpc.World.WorldRequest;
import com.example.grpc.World.WorldResponse;
import com.example.grpc.worldGrpc.worldBlockingStub;
import io.grpc.*;
public class Hello {
    public static void main(String[] args) throws Exception {
        ManagedChannelBuilder builder = ManagedChannelBuilder.forTarget("world:8080").usePlaintext(true);
        final ManagedChannel channel = builder.build();
        worldBlockingStub stub = worldGrpc.newBlockingStub(channel);
        WorldRequest request   = WorldRequest.newBuilder().setMessage1("hello").build();
        WorldResponse response = stub.world(request);
        System.out.println(response);
        channel.shutdownNow();
    }
}
