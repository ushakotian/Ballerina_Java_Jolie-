execution { concurrent } // Handle clients concurrently

interface HelloAPI {
RequestResponse: hello( void )( string )
}

interface WorldAPI {
RequestResponse: world( void )( string )
}

inputPort WorldInput {
location: "socket://localhost:8000"        
protocol: http { format = "json" }       
interfaces: WorldAPI                    
}


outputPort hello {
    Location: "socket://hello:8000/"
    Protocol: http 
    Interfaces: HelloAPI
}

main
{ 
    
    world(  )( response ) {
        hello@hello(  )( response1 );
        response = response1 +"{\"message2\": \"world\"}" 
        
    }

}