#!usr/bin/sh
bash /usr/bin/mysqld_safe & 
bash /opt/webanno/bin/startup.sh 
tail -f /opt/webanno/logs/catalina.out 
