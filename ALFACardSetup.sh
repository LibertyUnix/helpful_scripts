echo "Installing DKMS"
sudo apt-get install dkms
mkdir tools/dev/
cd tools/dev/
echo "Installing RTL8812AU Driver"
git clone https://github.com/aircrack-ng/rtl8812au
cd rtl8812au/
sudo ./dkms-install.sh 
echo "Installing Aicrack-NG"
sudo apt-get install aircrack-ng 
clear
echo"Configuring Monitor Mode"
sudo airmon-ng check kill
sudo ip link set wlan1 down
sudo iw dev wlan1 set type monitor
sudo ip link set wlan1 up
sudo iw wlan0 set txpower fixed 3000
echo "All Done - Use Airmon-ng wlanX to begin!"
