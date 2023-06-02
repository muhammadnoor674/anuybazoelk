#!/bin/bash

clear

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color3='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
WKT=$(curl -s ipinfo.io/timezone )
IPVPS=$(curl -s ipv4.icanhazip.com )
	echo "-------------------- Welcome To Premium Script Menu ---------------"
	echo "------------------------ Created By NYARIGRATISAN  -----------------------"
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	echo -e "\e[032;1mCPU Model:\e[0m $cname"
	echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
	echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
	echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem Uptime:\e[0m $up"
	echo -e "\e[032;1mIsp Name:\e[0m $ISP"
	echo -e "\e[032;1mCity:\e[0m $CITY"
	echo -e "\e[032;1mTime:\e[0m $WKT"
	echo -e "\e[033;1mIPVPS:\e[0m $IPVPS"
	date | lolcat
	echo -e "-----------------------------------------------------"

echo -e ""

echo -e "Menu Utama" | lolcat -a -d 10

echo -e " 1.  SSH & OVPN"

echo -e " 2.  Vmess"

echo -e " 3.  Vless"

echo -e " 4.  Trojan Gfw

echo -e " 5.  Trojan Go"

echo -e ""

echo -e "Menu Tambahan" | lolcat -a -d 10

echo -e " 9.   Add Subdomain Host"

echo -e " 10.  Renew Certxray"

echo -e " 11.  Change Port"

echo -e " 12.  Autobackup Data"

echo -e " 13.  Backup Data"

echo -e " 14.  Restore Data"

echo -e " 15.  Webmin Menu"

echo -e " 16.  Limit Bandwith Speed Server"

echo -e " 17.  Check Usage Ram"

echo -e " 18.  Reboot"

echo -e " 19.  Speedtest"

echo -e " 20.  Information Display System"

echo -e " 21.  Info Script Auto Install"

echo -e " 22.  Restart All Service"

echo -e " 23.  Set Auto Reboot"

echo -e " 24.  Set Multi Login Akun"

echo -e " 25.  Install BBR"

echo -e " 26.  Add ID Cloudfare"

echo -e " 27.  Cloudfare Add-Ons"

echo -e " 28.  Pointing Bug"

echo -e " 29.  Status Tunneling"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e " x.   Exit From Putty / JuiceSSH / Termux"

echo -e "\e[32m══════════════════════════════════════════\e[m"

echo -e ""

read -p "     Please Input Number  [1-22 or x] :  "  num

echo -e ""

case $num in

1)

tessh

;;

2)

vmess

;;

3)

vless

;;

4)

trojan

;;

5)

trgo

;;

9)

add-host

;;

10)

certxray

;;

11)

change-port

;;

12)

autobackup

;;

13)

backup

;;

14)

restore

;;

15)

wbmn

;;

16)

limit-speed

;;

17)

ram

;;

18)

reboot

;;

19)

speedtest

;;

20)

info

;;

21)

about

;;

22)

restart

;;

23)

auto-reboot

;;

24)

autokill

;;

25)

bbr

;;

26)

cff

;;

27)

cfd

;;

28)

cfh

;;

29)

running

;;

x)

exit

;;

*)

echo "Please enter an correct number"

;;

esac