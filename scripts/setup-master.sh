#!/bin/sh

source "/vagrant/scripts/common.sh"

function setupslave {
	echo "setup up slave nodes "
	
	for i in $(seq 1 $TOTAL_NODES)
	do 
		entry="sparknode${i}"
		echo "adding ${entry}"
		echo "${entry}" >> /opt/spark/conf/slaves.temp
	done
	cp /opt/spark/conf/slaves.temp /opt/spark/conf/slaves
	rm /opt/spark/conf/slaves.temp

}


setupslave