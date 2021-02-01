package javaeetutorial.hello;
import javax.ws.rs.*;
import com.rabbitmq.client.*;
import java.util.logging.*;
import java.nio.charset.*;

@Path("hello")
public class Hello {  
    
    public Hello() {
    }
    
    @GET    
    public String get() {
        long time = System.currentTimeMillis();
        System.out.println("Request Received Time = " + time);
        String  QUEUE_NAME = "hello-json";        
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("rabbitmq");
        try (Connection connection = factory.newConnection();   Channel channel = connection.createChannel()) {
            channel.queueDeclare(QUEUE_NAME, false, false, false, null);
            String message =  "{\"message1\":\"hello\"}";
            time = System.currentTimeMillis();
            System.out.println("Message sent Time = " + time);
            channel.basicPublish("", QUEUE_NAME, null, message.getBytes(StandardCharsets.UTF_8));            
        } catch (Exception ex) {
            Logger.getLogger(Hello.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "Message Sent to the World Service";
    }    
}
