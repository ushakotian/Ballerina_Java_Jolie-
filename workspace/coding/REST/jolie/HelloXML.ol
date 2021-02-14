execution { concurrent }

type message: void {    
    .message1: string
}

interface HelloAPI {
    RequestResponse: hello( void )( message )
}
inputPort HelloInput {
    location: "socket://localhost:8000"        
    protocol: http   { format = "xml" }    
    interfaces: HelloAPI                    
}

main{    
    hello(  )( message ) {
      message.message1 = "hello"
    }
}