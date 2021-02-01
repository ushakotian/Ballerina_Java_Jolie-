execution { concurrent } 
type message: void {    
    message1: string
}
type finalmessage: void {    
    finalmessage: string
}
interface HelloAPI {
	RequestResponse: hello( void )( message )
}
interface WorldAPI {
	RequestResponse: world( void )( finalmessage )
}
inputPort WorldInput {
	location: "socket://localhost:8001"        
	protocol: http { format = "json" }       
	interfaces: WorldAPI                    
}
outputPort hello {
    Location: "socket://hello:8000/"
    Protocol: http 
    Interfaces: HelloAPI
}
main{     
    world(  )( finalmessage ) {       
        retrieveHelloResponses
        finalmessage << {
			finalmessage = message.message1 + " world"
		}             
    }    
}
define retrieveHelloResponses {
        hello@hello(  )( message )       
}