#!/bin/sh

source "/vagrant/scripts/common.sh"

function setupspark {
	echo "install spark"
	cp /vagrant/resources/${SPARK_TGZ}.tgz /opt
	tar -zxvf /opt/${SPARK_TGZ}.tgz -C /opt/
	rm -rf /opt/spark
	ln -s /opt/${SPARK_TGZ} /opt/spark
}
 
function setupsave {
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

setupspark