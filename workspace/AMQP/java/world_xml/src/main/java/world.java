
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.DeliverCallback;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
public class world {
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
                Logger.getLogger(world.class.getName()).log(Level.SEVERE, null, ex);
            }
        };
        channel.basicConsume(QUEUE_NAME, true, deliverCallback, consumerTag -> {
        });
    }
}
