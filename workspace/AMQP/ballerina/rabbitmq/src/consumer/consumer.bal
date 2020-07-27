import ballerina/log;
import ballerina/rabbitmq;

rabbitmq:Connection connection = new ({host: "localhost", port: 5672});

listener rabbitmq:Listener channelListener = new (connection);

const string  QUEUE_NAME = "hello";

@rabbitmq:ServiceConfig {
    queueConfig: {
        queueName: QUEUE_NAME, durable : false, exclusive: false, autoDelete : false
    }
}
service rabbitmqConsumer on channelListener {    

    resource function onMessage(rabbitmq:Message message) {        
        var messageContent = message.getTextContent();
        if (messageContent is string) {             
            log:printInfo(" [x] Received '" + messageContent + "'");
        } 
    }
}
