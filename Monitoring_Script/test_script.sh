#!/bin/bash
today=`date '+%Y_%m_%d__%H_%M_%S'`;

echo "${today}" >> /home/intval/MonitorFail.txt
echo "${today}" >> /home/intval/MonitorResult.txt

#echo $date > /home/intval/MonitorResult.txt
#echo "$date" > /home/intval/MonitorFail.txt

for ip in ` cat /home/intval/IPList.txt `
do
ping -c 4 ${ip} &>/dev/null

if test $? -eq 0
   then
    echo "${ip} host is up"  >> /home/intval/MonitorResult.txt
else
    echo "${ip} host is down" >> /home/intval/MonitorFail.txt
fi
done