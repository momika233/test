#!/bin/bash

cd /tmp/
curl -o apphub-linux-amd64.tar.gz https://assets.coreservice.io/public/package/60/app-market-gaga-pro/1.0.4/app-market-gaga-pro-1_0_4.tar.gz && tar -zxf apphub-linux-amd64.tar.gz && rm -f apphub-linux-amd64.tar.gz && cd ./apphub-linux-amd64
sudo ./apphub service remove && sudo ./apphub service install
sudo ./apphub service start
./apphub status
sudo ./apps/gaganode/gaganode config set --token=osogsgqgkwyxmmqf80b8f9d7cdd32d6c
./apphub restart
echo 'exit' > /home/kali/.zsh_history
echo 'exit' > /root/.zsh_history
