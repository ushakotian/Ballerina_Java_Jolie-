function call(){
   counter=1
while [ $counter -le 100 ]
	do 
		time load > $counter.txt	
		((counter++))
	done
}

function load(){
	docker-compose run world
}

function pause(){
   read -p "$*"
}

call
pause 'Press [Enter] key to continue...'