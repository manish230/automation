#!/bin/bash
action=$1
PID=$2
path="/etc/init.d/logstash"
#logfile="/var/log/cronscript.log"

# checking actions parameter
if [ $action == "restart" ]
then
kill -9 $PID
sleep 30
echo "`date` starting logstash process" 

sudo $path start
pid2=$(netstat -ntlpa 2>/dev/null | grep java | awk '{print $7}' | cut -d "/" -f1 | uniq)
echo "`date` lostash process started with pid $pid2" 

fi

if [ $action == "start" ]
then
echo "`date` No Active process found so starting new logstash process"
sudo $path start
fi 
