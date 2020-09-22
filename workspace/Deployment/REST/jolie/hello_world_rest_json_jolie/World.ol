include "json_utils.iol"
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
	location: "socket://localhost:8000"        
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
			finalmessage = message + " world"
		}             
    }    
}
define retrieveHelloResponses {
        hello@hello(  )( response )
        getJsonString@JsonUtils(response.message1)( message1)
        getJsonValue@JsonUtils(message1)( message )
}