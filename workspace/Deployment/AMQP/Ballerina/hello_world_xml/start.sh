function test(){
   counter=1
while [ $counter -le 10 ]
	do 
		curl -i http://localhost:9091/hello/hello 		
		
		((counter++))
	done
}

function up(){
	docker-compose up -d --build
	
}

function down(){
	docker-compose down
}


function pause(){
   read -p "$*"
}

up
up
time test
#down
pause 'Press [Enter] key to continue...'