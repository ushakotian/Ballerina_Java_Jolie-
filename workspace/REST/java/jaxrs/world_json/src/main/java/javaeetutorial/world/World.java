package javaeetutorial.world;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import org.json.JSONObject;
@Path("world")
public class World {
    public World() {
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getHtml() {
        String message = retrieveHelloResponses();
        String finalmessage = "{\"finalmessage\":\" " + message + " world\"}";
        return finalmessage;
    }
    public String retrieveHelloResponses() {
        String baseUri = "http://hello:8080/hello/";
        Client client = ClientBuilder.newClient();
        WebTarget target = client.target(baseUri).path("hello");
        String response = target.request(MediaType.APPLICATION_JSON).get(String.class);
        JSONObject jsonObject = new JSONObject(response);
        String val = jsonObject.getString("message1");
        return val;
    }
}
