/**
 * Copyright (c) 2014 Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software except in
 * compliance with the terms of the License at:
 * https://github.com/javaee/tutorial-examples/LICENSE.txt
 */
package javaeetutorial.hello;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;
//import io.grpc.Channel;
//import io.grpc.ManagedChannel;
//import io.grpc.ManagedChannelBuilder;
//import io.grpc.StatusRuntimeException;

/**
 * Root resource (exposed at "helloworld" path)
 */
@Path("hello")
public class HelloWorld {

    @Context
    private UriInfo context;

    /**
     * Creates a new instance of HelloWorld
     */
    public HelloWorld() {

    }

    /**
     * Retrieves representation of an instance of helloWorld.HelloWorld
     *
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getHtml() {
        // return "Hello";
        String target = "localhost:50051";
  //      ManagedChannel channel = ManagedChannelBuilder.forTarget(target)

    //    .usePlaintext()
      //  .build();
        //GreeterGrpc.GreeterBlockingStub blockingStub = GreeterGrpc.newBlockingStub(channel);
        String message = "hello";
        // Access a service running on the local machine on port 50051
        
        //ManagedChannel channel = ManagedChannelBuilder.forTarget(target)
          //      .usePlaintext()
            //    .build();
        //try {
            //HelloRequest request = HelloRequest.newBuilder().setName(message).build();
            //HelloResponse response;
            //try {
              //  response = blockingStub.hello(request);
            //} catch (StatusRuntimeException e) {
                // log error
            //}
            //logger.info("Greeting: " + response.getMessage());
        //} finally {

            //channel.shutdownNow().awaitTermination(5, TimeUnit.SECONDS);
        //}
        return "{\"message1\":\"Hello\"}";
    }

}
