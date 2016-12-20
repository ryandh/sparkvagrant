#!/bin/sh

source "/vagrant/scripts/common.sh"

function setupjvm {
	echo "install jvm"
	cp /vagrant/resources/$JAVA_RPM /opt
	if ! rpm -qa | grep jdk; then
    rpm -ivh /opt/$JAVA_RPM
	fi
	
}
setupjvm