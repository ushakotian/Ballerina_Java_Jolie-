import ballerina/log;
import ballerina/rabbitmq;
import ballerina/config;
rabbitmq:Connection connection = new ({host:config:getAsString("rabbitmq.host"), port: 5672});
listener rabbitmq:Listener channelListener = new (connection);
const string  QUEUE_NAME2 = "hello-xml";
@rabbitmq:ServiceConfig {
    queueConfig: {
        queueName: QUEUE_NAME2, durable : false, exclusive: false, autoDelete : false
    }
}
service rabbitmqConsumer2 on channelListener {    
    resource function onMessage(rabbitmq:Message message)  returns error?{        
        var response = message.getXMLContent();      
        if (response is xml) {  
            xml value = response/*;           
            log:printInfo("finalmessage = " + value.toString() + " world");                        
        } 
    }
}
