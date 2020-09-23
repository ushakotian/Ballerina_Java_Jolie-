function test(){
   counter=1
while [ $counter -le 10 ]
	do 
		docker-compose run hello
		((counter++))
	done
}

function up(){
	docker-compose up -d
}

function down(){
	docker-compose down
}


function pause(){
   read -p "$*"
}

up
time test
down
pause 'Press [Enter] key to continue...'