import ballerina/config;
import ballerina/log;
import ballerina/rabbitmq;
import ballerina/stringutils;
import ballerina/time;
const string QUEUE_NAME = "hello-json";
@rabbitmq:ServiceConfig {
    queueConfig: {
        queueName: QUEUE_NAME,
        durable: false,
        exclusive: false,
        autoDelete: false
    }
}

service world on new rabbitmq:Listener(new rabbitmq:Connection({host: config:getAsString("rabbitmq.host"), port: 5672})) {
    
    resource function onMessage(rabbitmq:Message message) returns error? {
        time:Time time = time:currentTime();
        int startTime = time.time;
        log:printInfo("Message Received Time = " + startTime.toString());
        var messageContent = message.getTextContent();
        if (messageContent is json) {
            string[] res = stringutils:split(messageContent, "=");
            log:printInfo("finalmessage = " + res[1] + " world");
        }
        time = time:currentTime();
        int endTime = time.time;
        log:printInfo("Message Processed Time = " + endTime.toString());
    }
}
