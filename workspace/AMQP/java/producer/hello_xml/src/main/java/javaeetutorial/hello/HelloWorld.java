package javaeetutorial.hello;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.nio.charset.StandardCharsets;
@Path("hello")
public class HelloWorld {    
    public HelloWorld() {
    }
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String getHtml() {
        long time = System.currentTimeMillis();
        System.out.println("Request Received Time = " + time);
        String  QUEUE_NAME = "hello-xml";        
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("rabbitmq");
        try (Connection connection = factory.newConnection();   Channel channel = connection.createChannel()) {
            channel.queueDeclare(QUEUE_NAME, false, false, false, null);
            String message = "<message1>hello</message1>";
            time = System.currentTimeMillis();
            System.out.println("Message sent Time = " + time);
            channel.basicPublish("", QUEUE_NAME, null, message.getBytes(StandardCharsets.UTF_8));            
        } catch (Exception ex) {
            Logger.getLogger(HelloWorld.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Message Sent to the World Service";
    }   
}
