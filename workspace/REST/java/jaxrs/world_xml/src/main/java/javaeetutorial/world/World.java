package javaeetutorial.world;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.MediaType;


@Path("world")
public class World {
    private Client client;
    private final String baseUri = "http://hello-xml:8080/hello/";
    
    public World(){
    
    }


    @GET
    @Produces(MediaType.APPLICATION_XML)
    public String getHtml() {
        this.client = ClientBuilder.newClient();
        String res = retrieveHelloResponses();
        return  "<root>"+res + "<message2>world</message2></root>";
    }


    public String retrieveHelloResponses() {      
            System.out.println("BaseURI = " + baseUri);
            String str = client.target(baseUri)
                    .path("hello")
                    .request(MediaType.APPLICATION_XML).get(String.class);
            return str;
            
    }
}
