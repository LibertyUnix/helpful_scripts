#!/bin/bash
#@libertyunix
#Simple bash script to 1st ping all ips in a range,discover services, pipe output to a file for each services
echo "Enter IP range: "
read ips
nmap -sn -vv -oG tmp_scan $ips
cat tmp_scan | grep "Up" | cut -d " " -f2 > discoveredhost.txt
rm tmp_scan
nmap -sS --top-ports=100 -v -iL discoveredhost.txt -oG servicesup -oX metasploit-$clientname.xml
clear
echo "[*] Cleaning up and organizing"
cat servicesup | grep "22/open" | cut -d " " -f2 > ssh.txt
cat servicesup | grep "25/open" | cut -d " " -f2 > smtp.txt
cat servicesup | grep "21/open" | cut -d " " -f2 > ftp.txt
cat servicesup | grep "80/open" | cut -d " " -f2 > http.txt
cat servicesup | grep "443/open" | cut -d " " -f2 > https.txt
cat servicesup | grep "445/open" | cut -d " " -f2 > smb.txt
cat servicesup | grep "3389/open"| cut -d " " -f2 > rdp.txt

echo "Lets take a look at SMB"

