package javaeetutorial.world;


import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.MediaType;


@Path("world")
public class World {
    private Client client;
    private final String baseUri = "http://hello:8080/hello/";
    
    public World(){
    
    }
   
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getHtml() {
        this.client = ClientBuilder.newClient();
        String res = retrieveHelloResponses();
        String message2 = "{\"message2\":\"world\"}";
        return res + message2;
    }
    
    
    public String retrieveHelloResponses() {       
            System.out.println("baseUri = " + baseUri);
            String str = client.target(baseUri)
                    .path("hello")
                    .request(MediaType.APPLICATION_JSON).get(String.class);
            return str;
            
       
    }
}
