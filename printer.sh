#!/bin/bash

apt update
apt install -y cups
usermod -a -G lpadmin root
cupsctl --remote-any
apt install -y hplip hplip-data printer-driver-foo2zjs 
printer-driver-foo2zjs-common printer-driver-pxljr

systemctl restart cups

IP=$(hostname -I | awk '{print $1}')

echo "
Optional:
	Set static ip:
	```
	$ nano /etc/network/interfaces
		allow-hotplug ens18
		iface ens18 inet static
		  address 192.168.0.111
		  netmask 255.255.255.0
		  gateway 192.168.0.1
	$ systemctl restart networking  
	```
Go to http://$IP:631
Administration
Find New Printers
Driver: HP LaserJet 1018 Foomatic/foo2zjs-z1 (recommended) (grayscale)
Sharing: (checked) Share This Printer
"
