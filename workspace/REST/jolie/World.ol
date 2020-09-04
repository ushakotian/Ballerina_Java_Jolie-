execution { concurrent } // Handle clients concurrently

interface HelloAPI {
RequestResponse: hello( void )( string )
}

interface WorldAPI {
RequestResponse: world( void )( string )
}

inputPort WorldInput {
location: "socket://localhost:8082"        // Use TCP/IP
protocol: http { format = "json" }       // Use HTTP
interfaces: WorldAPI                    // Publish HelloWorldAPI
}


outputPort hello {
    Location: "socket://localhost:8000/"
    Protocol: http 
    Interfaces: HelloAPI
}

main
{ 
    
    world(  )( response ) {
        hello@hello(  )( response1 );
        response = response1 +"{\"message2\": \"World\"}" 
        
    }

}