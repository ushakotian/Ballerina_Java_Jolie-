import ballerina/io;
import ballerina/rabbitmq;

const string  QUEUE_NAME = "hello";

public function main() {   

    rabbitmq:Connection connection = new ({host: "localhost", port: 5672});

    rabbitmq:Channel channel1 = new (connection);
    
    var queueResult1 = channel1->queueDeclare({ queueName: QUEUE_NAME,durable : false,exclusive: false,autoDelete : false });  
    
    string message = "Hello World!";

    worker w {
        var sendResult = channel1->basicPublish(message,QUEUE_NAME);        
    }
    wait w;
    io:println(" [x] Sent '" + message + "'");
    
}
