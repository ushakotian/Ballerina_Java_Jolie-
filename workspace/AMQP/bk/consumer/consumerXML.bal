import ballerina/log;
import ballerina/rabbitmq;


rabbitmq:Connection connection2 = new ({host: "localhost", port: 5672});

listener rabbitmq:Listener channelListener2 = new (connection2);

const string  QUEUE_NAME2 = "hello-xml";

@rabbitmq:ServiceConfig {
    queueConfig: {
        queueName: QUEUE_NAME2, durable : false, exclusive: false, autoDelete : false
    }
}
service rabbitmqConsumer2 on channelListener2 {    

    resource function onMessage(rabbitmq:Message message)  returns error?{        
        var messageContent = message.getXMLContent();
        if (messageContent is xml) {             
            log:printInfo(" [x] Received '" + messageContent.toString() + "'");
            
            
            
        } 
    }
}
