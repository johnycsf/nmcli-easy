#!/bin/bash
echo "Let's configure the network with a static IP"; sleep 1
echo""
echo "Cleaning things up..."; sleep 1
nmcli con show | awk -F " " '{print $1}' > /tmp/con.txt
nmcli con down $(cat /tmp/con.txt) 2> /dev/null
nmcli con delete $(cat /tmp/con.txt) 2> /dev/null
echo "All done!"; sleep 2
echo ""
echo "What is the NIC name? check ifconfig or ip a"
read NICname
echo "Please enter the IP/SUBNET for example 10.10.10.10/24"
read ipaddr
echo "Please enter the GATEWAY or your Router IP"
read gw
echo "Please enter a name for the connection for the connection"
read coname
"echo "Working..."; sleep 1
nmcli con add con-name $coname ifname $NICname type ethernet ip4 $ipaddr gw4 $gw
echo ""
echo "Please enter the DNS of choice, Only 1 DNS IP!"
read dns1
echo""
echo "Please enter secondary DNS IP."
read dns2
echo ""
echo "Working..."; sleep 1
nmcli con mod $coname ipv4.dns $dns1
nmcli con mod $coname +ipv4.dns $dns2
echo""
echo "Making sure connection starts on boot!"; sleep 1
nmcli con mod $coname connection.autoconnect yes
echo ""
echo "Testing..."; sleep 1
ping -c 4 www.google.com
echo ""
echo "Done"
