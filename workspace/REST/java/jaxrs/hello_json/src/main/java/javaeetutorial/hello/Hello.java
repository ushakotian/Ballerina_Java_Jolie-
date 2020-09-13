package javaeetutorial.hello;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;


@Path("hello")
public class Hello {
    
    public Hello(){
    }
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getHtml() {        
        return "{\"message1\":\"hello\"}";
    }

   
}
