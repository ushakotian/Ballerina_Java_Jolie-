package javaeetutorial.hello;
import javax.ws.rs.*;
import javax.ws.rs.core.*;

@Path("hello")
public class Hello {

    public Hello() {
    }

    @GET
    @Produces(MediaType.APPLICATION_XML)
    public String getHtml() {
        return "<message1>hello</message1>";
    }
}
