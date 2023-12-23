#!/bin/bash

msisdn=$1

len=`echo -n $msisdn | wc -c`
if [ $len -eq 12 ]
then
        prefix=`echo $msisdn | cut -c1-2`
        if [ "$prefix" = "91" ]
        then
                msisdn=`echo $msisdn | cut -c3-12`
        fi

elif [ $len -eq 11 ]
then
        prefix1=`echo $msisdn | cut -c1-1`
        if [ "$prefix1" = "0" ]
        then
                msisdn=`echo $msisdn | cut -c2-11`
        fi

fi

if [ $len -lt 8 ]
then
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^";
else


prefix=`echo $msisdn | cut -c1-4`

#ans=`grep -H $msisdn /mnt/ramdisk/workarea/*/$prefix.out | head -1 | sed s/:/\~/`


#Check MNP Here
response=`/root/integrate/bin/getmnp.sh $msisdn | cut -f1 -d^`
ans=`grep -H $msisdn /mnt/ramdisk/workarea/*/$prefix.out | head -1 | sed s/:/\~/`

if [ -n "$ans" ]
then
        addoper=`echo $ans|cut -f1 -d~`
        otherpart=`echo $ans|cut -f2 -d~`
else
        mysql -N -b -u root subscribers > /tmp/oper$msisdn.out << EOT
                select concat(operator,'') from lrnoperator where lrn = (select lrn from lrnmap where startmsisdn < $msisdn and endmsisdn>$msisdn) limit 1
        union all
        select concat(operator,'') from numleveloper where operid = (select oper from numlevel where level = substr($msisdn,1,4) limit 1) limit 1;
EOT
addoper=`cat /tmp/oper$msisdn.out`
otherpart="^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
fi

if [ $response = "Error" ]
then
        echo $addoper"^"$otherpart
else
        echo $response"^"$otherpart

fi

fi
