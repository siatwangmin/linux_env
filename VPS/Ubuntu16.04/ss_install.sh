#!/bin/bash
#this is a shell script


sudo apt-get install shadowsocks
sudo apt-get install proxychains

sudo sed -i -e '/^socks4.*127.0.0.1.*9050/d' /etc/proxychains.conf
#sudo sed -i "s/^socks4.*127.0.0.1.*9050/#socks4 127.0.0.1 9050/g" /etc/proxychains.conf

if grep "^socks5.*127.0.0.1.*1080" /etc/proxychains.conf
then
	echo "config is right"
else
	sudo echo "socks5 127.0.0.1 1080" >> /etc/proxychains.conf
fi

if [ -e /etc/shadowsocks ]
then
	echo "shadowsocks is here"
	if [ -e /etc/shadowsocks/config.json ]
	then
		echo "config is here, remove it"
		sudo rm /etc/shadowsocks/config.json
	fi

	if [ -e /etc/shadowsocks/log ]
	then
		echo "log is here, remove it"
		sudo rm /etc/shadowsocks/log
	fi

	sudo cp ./config.json /etc/shadowsocks/
	echo "copy config to"
	sudo touch /etc/shadowsocks/log
	sudo chmod 777 /etc/shadowsocks/log
	echo "create log"
else
	sudo mkdir /etc/shadowsocks
	sudo cp ./config.json /etc/shadowsocks/
	sudo touch /etc/shadowsocks/log
	sudo chmod 777 /etc/shadowsocks/log
	echo "create log"
fi

if grep "sslocal" /etc/rc.local
then
	echo "sslocal is here"
else	
	sudo sed -i "/^exit*.0/i\sudo nohup sslocal -c /etc/shadowsocks/config.json > /etc/shadowsocks/log &"  /etc/rc.local
fi

echo "OK"
exit 0
