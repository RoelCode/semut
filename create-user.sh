#!/bin/bash
#Script auto create user SSH

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`curl icanhazip.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Informasi SSH"
echo -e "=========-account-=========="
echo -e "Host: $IP" 
echo -e "Port OpenSSH : 22, 143"
echo -e "Port Dropbear : 442, 109, 110, 80"
echo -e "Port SSL/TLS : 443"
echo -e "SquidProxy    : 8080, 8888, 3128"
echo -e "OpenVPN : TCP 1194 (client config : http://$IP:81/client.ovpn)"
echo -e "Username: $Login "
echo -e "Password: $Pass"
echo -e "-----------------------------"
echo -e "Aktif Sampai: $exp"
echo -e "============================"
