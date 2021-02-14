import ballerina/log;
import ballerina/rabbitmq;
import ballerina/config;
import ballerina/time;
const string  QUEUE_NAME2 = "hello-xml";
@rabbitmq:ServiceConfig {
    queueConfig: {
        queueName: QUEUE_NAME2, durable : false, exclusive: false, autoDelete : false
    }
}

service world_xml on new rabbitmq:Listener(new rabbitmq:Connection({host: config:getAsString("rabbitmq.host"), port: 5672})) {
    
    resource function onMessage(rabbitmq:Message message)  returns error?{ 
        time:Time time = time:currentTime();
        int startTime = time.time;
        log:printInfo("Message Received Time = " + startTime.toString());       
        var response = message.getXMLContent();      
        if (response is xml) {  
            xml value = response/*;           
            log:printInfo("finalmessage = " + value.toString() + " world");   
            time = time:currentTime();  
            int endTime = time.time;          
            log:printInfo("Message Processed Time = " + endTime.toString());                     
        } 
    }
}
