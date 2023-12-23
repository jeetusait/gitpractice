#!/bin/sh

while [ 1 -eq 1 ]
do
	ans=`ps -aef | grep iLocatorWeb.pl  | grep -v grep`
	if [ -z "$ans" ]
	then
		perl ./iLocatorWeb.pl >> iLocatorWeb.log 2>&1
	fi
	sleep 5
done
