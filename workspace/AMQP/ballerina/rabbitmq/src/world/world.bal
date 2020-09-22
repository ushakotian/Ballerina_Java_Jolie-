import ballerina/config;
import ballerina/log;
import ballerina/rabbitmq;
import ballerina/stringutils;
rabbitmq:Connection connection = new ({host: config:getAsString("rabbitmq.host"), port: 5672});
listener rabbitmq:Listener channelListener = new (connection);
const string QUEUE_NAME = "hello-json";
@rabbitmq:ServiceConfig {
    queueConfig: {
        queueName: QUEUE_NAME,
        durable: false,
        exclusive: false,
        autoDelete: false
    }
}
service rabbitmqConsumer on channelListener {
    resource function onMessage(rabbitmq:Message message) returns error? {
        var messageContent = message.getTextContent();
        if (messageContent is json) {
            string[] res = stringutils:split(messageContent, "=");
            log:printInfo("finalmessage = " + res[1] + " world");
        }
    }
}
