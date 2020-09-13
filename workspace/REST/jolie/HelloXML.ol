execution { concurrent } // Handle clients concurrently


interface HelloAPI {
RequestResponse: hello( void )( string )
}


inputPort HelloInput {
location: "socket://localhost:8081"        
protocol: http      // Use HTTP
interfaces: HelloAPI                    
}


main
{    
    hello(  )( response ) {
        response = "<message1>hello</message1>" 
    }
}