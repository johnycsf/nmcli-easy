# nmcli-easy
Easy and interactive way to configure static IP using nmcli

nmcli is being adopted as the primary way to configure static IP in linux.
I am having troubles remembering all the commands so I made this to be an interactive and easy way to do so without the hassle of remembering everything because time is valuable.

***Make sure you check with ifconfig or "ip a" the name of your interface!***

Some servers it's eth0, others are eno1, other it's enp0s3, etc...
You need to know and enter it when prompted for NIC name when running the script!

***Script must be run as root!***

sudo bash nmcli-easy.sh

