/**
 * Copyright (c) 2014 Oracle and/or its affiliates. All rights reserved.
 *
 * You may not modify, use, reproduce, or distribute this software except in
 * compliance with  the terms of the License at:
 * https://github.com/javaee/tutorial-examples/LICENSE.txt
 */
package javaeetutorial.world;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;

/**
 * Root resource (exposed at "helloworld" path)
 */
@Path("world")
public class World {
    private Client client;
    private final String baseUri = "http://localhost:8080/hello_json/";
    
    @Context
    private UriInfo context;

    /** Creates a new instance of HelloWorld */
    public World() {
    }

    /**
     * Retrieves representation of an instance of helloWorld.HelloWorld
     * @return an instance of java.lang.String
     */
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getHtml() {
        this.client = ClientBuilder.newClient();
        String res = retrieveHelloResponses();
        String message2 = "{\"message2\":\"World\"}";
        return res + message2;
    }
    
    
    /**
     * Gets a collection of responses for the current event
     *
     * @return a List of responses
     */
    public String retrieveHelloResponses() {
       
        
        try {
            String str = client.target(baseUri)
                    .path("hello")
                    .request(MediaType.APPLICATION_JSON).get(String.class);
            return str;
            
        } catch (Exception ex) {
            
            return "Error";
        }
    }
}
