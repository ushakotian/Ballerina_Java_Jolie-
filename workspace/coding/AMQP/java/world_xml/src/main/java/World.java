import com.rabbitmq.client.*;
import java.io.*;
import java.util.logging.*;
import javax.xml.parsers.*;
import org.w3c.dom.*;
import org.xml.sax.*;

public class World {	
    private final static String QUEUE_NAME = "hello-xml";
	
    public static void main(String[] argv) throws Exception {
        ConnectionFactory factory = new ConnectionFactory();
        factory.setHost("rabbitmq");
        Connection connection = factory.newConnection();
        Channel channel = connection.createChannel();
        channel.queueDeclare(QUEUE_NAME, false, false, false, null);
        DeliverCallback deliverCallback = (consumerTag, delivery) -> {
            long time = System.currentTimeMillis();
            System.out.println("Message Received Time = " + time);
            String response = new String(delivery.getBody(), "UTF-8");
            DocumentBuilderFactory documentBuilderFactory = DocumentBuilderFactory.newInstance();
            try {
                DocumentBuilder documentBuilder = documentBuilderFactory.newDocumentBuilder();
                Reader reader = new StringReader(response);
                InputSource inputSource = new InputSource(reader);
                Document doc = documentBuilder.parse(inputSource);
                String message = doc.getElementsByTagName("message1").item(0).getTextContent();
                System.out.println("finalmessage = " + message + " world");
                long endTime = System.currentTimeMillis();
                System.out.println("Message Processed Time = " + endTime);
            } catch (Exception ex) {
                Logger.getLogger(World.class.getName()).log(Level.SEVERE, null, ex);
            }
        };
        channel.basicConsume(QUEUE_NAME, true, deliverCallback, consumerTag -> {
        });
    }
}
