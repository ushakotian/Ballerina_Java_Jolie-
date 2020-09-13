execution { concurrent } // Handle clients concurrently


interface HelloAPI {
RequestResponse: hello( void )( string )
}


inputPort HelloInput {
location: "socket://localhost:8081"        // Use TCP/IP
protocol: http      // Use HTTP
interfaces: HelloAPI                    // Publish HelloWorldAPI
}


main
{    
    hello(  )( response ) {
        response = "<message1>Hello</message1>" 
    }
}