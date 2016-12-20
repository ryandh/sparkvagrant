#!/bin/sh

source "/vagrant/scripts/common.sh"


TOTAL_NODES=4

function setupHosts {
	echo "modifying /etc/hosts file"
	for i in $(seq 1 $TOTAL_NODES)
	do 
		entry="192.168.2.3${i} sparknode${i}"
		echo "adding ${entry}"
		echo "${entry}" >> /etc/nhosts
	done
	echo "127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4" >> /etc/nhosts
	echo "::1         localhost localhost.localdomain localhost6 localhost6.localdomain6" >> /etc/nhosts
	#cat /etc/hosts >> /etc/nhosts
	cp /etc/nhosts /etc/hosts
	rm -f /etc/nhosts

	#start eth1
	/sbin/ifup eth1
}

setupHosts