import ballerina/http;
import ballerina/rabbitmq;

@http:ServiceConfig {basePath: "/greet-xml"}
service greetXMl on new http:Listener(9092) {

    @http:ResourceConfig {
        methods: ["GET"],
        path: "/hello"
    }

    

    resource function hello(http:Caller caller,
        http:Request req) returns error? {
        
        string  QUEUE_NAME = "hello-xml";

        rabbitmq:Connection connection = new ({host: "localhost", port: 5672});

        rabbitmq:Channel channel1 = new (connection);

        var queueResult1 = channel1->queueDeclare({queueName: QUEUE_NAME, durable: false, exclusive: false, autoDelete: false});

        xml message = xml `<message1>hello</message1>`;

        worker w {
            var sendResult = channel1->basicPublish(message, QUEUE_NAME);
        }           
        check caller->respond("Message Sent to the Greeter Service");
        
        
    }
}
