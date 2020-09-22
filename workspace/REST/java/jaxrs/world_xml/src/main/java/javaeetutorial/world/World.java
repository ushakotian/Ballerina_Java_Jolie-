package javaeetutorial.world;
import java.io.Reader;
import java.io.StringReader;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
@Path("world")
public class World {        
    public World() {
    }
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public String getHtml() throws Exception {        
        String message = retrieveHelloResponses();
        String finalmessage = "<finalmessage>" + message + " world</finalmessage>";
        return finalmessage;
    }
    public String retrieveHelloResponses() throws Exception {
        Client client = ClientBuilder.newClient();
        String baseUri = "http://hello-xml:8080/hello/";
        WebTarget target = client.target(baseUri).path("hello");
        String str = target.request(MediaType.APPLICATION_XML).get(String.class);
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Reader reader = new StringReader(str);
        InputSource inputSource = new InputSource(reader);
        Document doc = documentBuilder.parse(inputSource);
        str = doc.getElementsByTagName("message1").item(0).getTextContent();
        return str;
    }
}
