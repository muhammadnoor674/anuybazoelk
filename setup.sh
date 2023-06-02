#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
rm -f setup.sh
clear
if [ -f "/etc/xray/domain" ]; then
echo "Script Nyari Gratisan Siap Diinstall"
exit 0
fi
mkdir /var/lib/premium-script;
echo "IP=" >> /var/lib/premium-script/ipvps.conf
mkdir /etc/xray
mkdir -p /etc/xray
wget https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/cf.sh && chmod +x cf.sh && ./cf.sh
#install xray
wget https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/ins-xray.sh && chmod +x ins-xray.sh && screen -S xray ./ins-xray.sh
#install ssh ovpn
wget https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/ssh-vpn.sh && chmod +x ssh-vpn.sh && screen -S ssh-vpn ./ssh-vpn.sh
# Install Websocket
wget https://raw.githubusercontent.com/senowahyu62/sshws-only/main/edu.sh && chmod +x edu.sh && ./edu.sh
#install Set-br
wget https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/set-br.sh && chmod +x set-br.sh && ./set-br.sh
# Install Sstp
#wget https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/sstp.sh && chmod +x sstp.sh && screen -S sstp ./sstp.sh
#install ssr
#wget https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/ssr.sh && chmod +x ssr.sh && screen -S ssr ./ssr.sh
#Install shadowshocks
#wget https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/sodosok.sh && chmod +x sodosok.sh && screen -S ss ./sodosok.sh
#installwg
#wget https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/wg.sh && chmod +x wg.sh && screen -S wg ./wg.sh
#install L2TP
#wget https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/ipsec.sh && chmod +x ipsec.sh && screen -S ipsec ./ipsec.sh

rm -f /root/ssh-vpn.sh
#rm -f /root/sstp.sh
#rm -f /root/wg.sh
#rm -f /root/ss.sh
#rm -f /root/ssr.sh
rm -f /root/ins-xray.sh
#rm -f /root/ipsec.sh
rm -f /root/set-br.sh
rm -f /root/edu.sh
rm -f /root/cf.sh
cat <<EOF> /etc/systemd/system/autosett.service
[Unit]
Description=autosetting
Documentation=https://wa.me/6285349326511

[Service]
Type=oneshot
ExecStart=/bin/bash /etc/set.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable autosett
wget -O /etc/set.sh "https://raw.githubusercontent.com/muhammadnoor674/anuybazoelk/main/set.sh"
chmod +x /etc/set.sh
history -c
echo "1.2" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-NYARIGRATISAN Vpn Store-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 222, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8000 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
#echo "   - Wireguard               : 7070"  | tee -a log-install.txt
#echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
#echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
#echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
#echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
#echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
#echo "   - SS-OBFS HTTP            : 3443-3543"  | tee -a log-install.txt
echo "   - xray Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - xray Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - xray Vless TLS         : 2083"  | tee -a log-install.txt
echo "   - xray Vless None TLS    : 8880"  | tee -a log-install.txt
echo "   - Trojan                  : 2087"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 05.00 GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo "   - White Label" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   - Dev/Main                : NYARIGRATISAN Vpn Store"  | tee -a log-install.txt
echo "   - Telegram                : t.me/anuybazoelk"  | tee -a log-install.txt
echo "   - Instagram               : *"  | tee -a log-install.txt
echo "   - Whatsapp                : https://wa.me/6285349326511"  | tee -a log-install.txt
echo "   - Facebook                : *" | tee -a log-install.txt
echo "------------------Script Created By NYARIGRATISAN Vpn Store-----------------" | tee -a log-install.txt
echo ""
echo " Server Reboot 5 Detik"
sleep 5
rm -f setup.sh
reboot

