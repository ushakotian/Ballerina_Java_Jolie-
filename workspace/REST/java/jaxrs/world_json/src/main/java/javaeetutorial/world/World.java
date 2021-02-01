package javaeetutorial.world;
import javax.ws.rs.*;
import javax.ws.rs.client.*;
import javax.ws.rs.core.*;
import org.json.*;

@Path("world")
public class World {

    public World() {
    }

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getHtml() {
        String baseUri = "http://hello:8080/hello/";
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target(baseUri).path("hello");
        String response = target.request(MediaType.APPLICATION_JSON).get(String.class);
        JSONObject jsonObject = new JSONObject(response);
        return "{\"finalmessage\":\" " + jsonObject.getString("message1") + " world\"}";
    }
}
