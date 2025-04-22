#!/bin/bash

# Instalacja pakietów CUPS i sterowników drukarki
apt update
apt install -y cups
usermod -a -G lpadmin root
cupsctl --remote-any
apt install -y hplip hplip-data printer-driver-foo2zjs printer-driver-foo2zjs-common printer-driver-pxljr

# Restart usługi CUPS
systemctl restart cups

# Pobranie aktualnego adresu IP (zakładając, że interfejs to eth0 lub użycie domyślnego)
IP=$(hostname -I | awk '{print $1}')

# Wyświetlenie instrukcji dla użytkownika
echo "
Optional:
	Set static ip
	```
	$ nano /etc/network/interfaces
	allow-hotplug ens18
	iface ens18 inet static
	  address 192.168.0.111
	  netmask 255.255.255.0
	  gateway 192.168.0.1
	```
Go to http://$IP:631
Administration
Find New Printers
Driver: HP LaserJet 1018 Foomatic/foo2zjs-z1 (recommended) (grayscale)
Sharing: (checked) Share This Printer
"
