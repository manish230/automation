#!/bin/bash
PID=$(netstat -ntlpa 2>/dev/null | grep java | awk '{print $7}' | cut -d "/" -f1 | uniq)
echo "PID:: "$PID

PID_HUNG=$(netstat -antlp 2>/dev/null | grep java | awk '{print $6,$7}' | cut -d "/" -f1 | grep -v ESTABLISHED | grep -v LISTEN | wc -l)
echo "PID_HUNG:: "$PID_HUNG

F_CPU=$(top -b -n 2 -d 1 -p $PID | tail -1 | awk '{print $9}')
echo "F_CPU:: "$F_CPU

CPU=${F_CPU%.*}
echo "CPU:: "$CPU

PID_COUNT=$(ps -aux | grep -c java)
echo "PID_COUNT:: "$PID_COUNT


if [ $PID_COUNT -le 1 ]
then
echo "Triggering Start Script"
bash /home/ubuntu/action.sh start
echo "LOG STASH STARTED ==> `date`"


elif [ $CPU -lt 5 -o $PID_HUNG -gt 0 ]
then
echo "Triggering Restart Script"
bash /home/ubuntu/action.sh restart $PID
echo "LOG STASH RESTARTED ==> `date`"

else
echo "CPU HIGH OR NO PID HUNG SO NO NEED TO RESTART LOGSTASH ==> `date`"
fi
