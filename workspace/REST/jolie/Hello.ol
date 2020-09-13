execution { concurrent } // Handle clients concurrently


interface HelloAPI {
RequestResponse: hello( void )( string )
}


inputPort HelloInput {
location: "socket://localhost:8000"        
protocol: http { format = "json" }       
interfaces: HelloAPI                    
}


main
{    
    hello(  )( response ) {
        response = "{\"message1\": \"hello\"}" 
    }
}