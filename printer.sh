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
Go to http://$IP:631

Add Printer: HP LaserJet 1018 (HP LaserJet1018)
Driver: HP LaserJet 1020 Foomatic/foo2zjs-z1 (recommended) (grayscale)
"
