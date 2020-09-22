import ballerina/http;
import ballerina/rabbitmq;
import ballerina/config;
@http:ServiceConfig {basePath: "/hello"}
service hello on new http:Listener(9090) {
    @http:ResourceConfig {
        methods: ["GET"],
        path: "/hello"
    }  
    resource function hello(http:Caller caller,  http:Request req) returns error? {        
        string  QUEUE_NAME = "hello-json";        
        rabbitmq:Connection connection = new ({host:config:getAsString("rabbitmq.host"), port: 5672});
        rabbitmq:Channel channel1 = new (connection);
        var queueResult1 = channel1->queueDeclare({queueName: QUEUE_NAME, durable: false, exclusive: false, autoDelete: false});
        json message = {"message1":"hello"};
        worker w {
            var sendResult = channel1->basicPublish(message, QUEUE_NAME);
        }           
        check caller->respond("Message Sent to the World Service");       
    }
}
