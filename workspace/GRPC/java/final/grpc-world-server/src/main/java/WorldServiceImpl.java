
import com.example.grpc.*;
import com.example.grpc.World.WorldRequest;
import com.example.grpc.World.WorldResponse;
import com.example.grpc.World.WorldResponse.Builder;
import io.grpc.Server;
import io.grpc.ServerBuilder;
import io.grpc.stub.StreamObserver;
public class WorldServiceImpl extends worldGrpc.worldImplBase {
    @Override
    public void world(WorldRequest  request,  StreamObserver<WorldResponse> responseObserver) { 
        Builder builder = WorldResponse.newBuilder();
        WorldResponse response = builder.setFinalmessage(request.getMessage1() + " world").build();
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    }    
    public static void main( String[] args ) throws Exception{      
      ServerBuilder serverBuilder = ServerBuilder.forPort(8080).addService(new WorldServiceImpl());
      Server server = serverBuilder.build();      
      server.start();                
      server.awaitTermination();
    }
}
