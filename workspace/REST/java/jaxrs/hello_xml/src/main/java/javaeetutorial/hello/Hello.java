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
    @Produces(MediaType.APPLICATION_XML)
    public String getHtml() {
        String message =    "<message1>hello</message1>" ;
        return message;
    }    
}
