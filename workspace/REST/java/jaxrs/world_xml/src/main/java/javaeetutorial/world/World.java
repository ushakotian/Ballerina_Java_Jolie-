package javaeetutorial.world;
import java.io.*;
import javax.ws.rs.*;
import javax.ws.rs.client.*;
import javax.ws.rs.core.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;

@Path("world")
public class World {

    public World() {
    }

    @GET
    @Produces(MediaType.APPLICATION_XML)
    public String getHtml() throws Exception {
        Client client = ClientBuilder.newClient();
        String baseUri = "http://hello-xml:8080/hello/";
        WebTarget target = client.target(baseUri).path("hello");
        String str = target.request(MediaType.APPLICATION_XML).get(String.class);
        DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
        Reader reader = new StringReader(str);
        InputSource inputSource = new InputSource(reader);
        Document doc = documentBuilder.parse(inputSource);        
        return "<finalmessage>" + doc.getElementsByTagName("message1").item(0).getTextContent() + " world</finalmessage>";
    }
}
