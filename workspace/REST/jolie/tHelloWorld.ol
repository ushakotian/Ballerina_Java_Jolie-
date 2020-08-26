execution { concurrent } // Handle clients concurrently

// Define the API that we are going to publish
interface HelloWorldAPI {
RequestResponse: helloWorld( void )( string )
}

// An input port publishes APIs to clients
inputPort HelloWorlInput {
location: "socket://localhost:8000"        // Use TCP/IP
protocol: http       // Use HTTP
interfaces: HelloWorldAPI                    // Publish HelloWorldAPI
}

// Implementation (the behaviour)
main
{    
    helloWorld(  )( response ) {
        response = "Hello, World! " 
    }
}