import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.rabbitmq.client.DeliverCallback;
import org.json.JSONObject;
public class world {
    private final static String QUEUE_NAME = "hello-json";
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
            JSONObject jsonObject = new JSONObject(response);
            String message = jsonObject.getString("message1");
            System.out.println("finalmessage = " + message + " world");
            long endTime = System.currentTimeMillis();
            System.out.println("Message Processed Time = " + endTime);
            
        };
        channel.basicConsume(QUEUE_NAME, true, deliverCallback, consumerTag -> {});
    }
}
