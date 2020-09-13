execution { concurrent } // Handle clients concurrently

interface HelloAPI {
RequestResponse: hello( void )( string )
}

interface WorldAPI {
RequestResponse: world( void )( string )
}

inputPort WorldInput {
location: "socket://localhost:8083"        
protocol: http { format = "xml" }       
interfaces: WorldAPI                    
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
        response = "<root>"+response1 +"<message2>world</message2></root>" 
        
    }

}