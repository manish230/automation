# automation
This contains some of my automation scripts i have ever created in bash or python
monitor_logstash.sh is a simple bash script which checks cpu and java related hung process and chose a decision either to restart or start a stopped or stuck logstash process. We can't use monit here since the process is not terminated in call cases. so monit tool would not be much helpful so i automated it with some bash script.
Here monitor_logstash.sh will run first then based on some variables like cpu %, hung_connections count and status of logstash pid. Then it will pass some argument to action.sh to do further action.
