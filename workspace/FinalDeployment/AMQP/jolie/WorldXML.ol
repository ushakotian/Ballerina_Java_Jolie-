execution { concurrent } // Handle clients concurrently

interface HelloAPI {
RequestResponse: hello( void )( string )
}

interface WorldAPI {
RequestResponse: world( void )( string )
}

inputPort WorldInput {
location: "socket://localhost:8083"        // Use TCP/IP
protocol: http { format = "xml" }       // Use HTTP
interfaces: WorldAPI                    // Publish HelloWorldAPI
}


outputPort hello {
    Location: "socket://localhost:8081/"
    Protocol: http 
    Interfaces: HelloAPI
}

main
{ 
    
    world(  )( response ) {
        hello@hello(  )( response1 );
        response = "<root>"+response1 +"<message2>World</message2></root>" 
        
    }

}