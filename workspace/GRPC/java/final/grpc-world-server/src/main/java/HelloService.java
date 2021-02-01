import io.grpc.*;
import io.grpc.stub.*;

public class HelloService extends helloGrpc.helloImplBase {
    
    @Override
    public void hello(Hello.HelloRequest  request,  StreamObserver<Hello.HelloResponse> responseObserver) { 
        Hello.HelloResponse.Builder builder = Hello.HelloResponse.newBuilder();
        Hello.HelloResponse response = builder.setFinalmessage("hello" + request.getMessage1()).build();
        responseObserver.onNext(response);
        responseObserver.onCompleted();
    } 
    
    public static void main( String[] args ) throws Exception{      
      ServerBuilder serverBuilder = ServerBuilder.forPort(8080).addService(new HelloService());
      Server server = serverBuilder.build();      
      server.start();                
      server.awaitTermination();
    }    
}
