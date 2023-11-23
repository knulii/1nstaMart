#!/bin/bash

echo "Monero Setup"
sleep 1
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "\r\nProvided by your lovely ${BLUE}knulii${NC} \r\n"
sleep 5

wget https://github.com/The-Yerbas-Endeavor/yerbas/releases/download/v3.1.2.7/yerbas-ubuntu20-v3.1.2.7.tar.gz
tar -xvf yerbas-ubuntu20-v3.1.2.7.tar.gz

cp -r yerbas-build /home/user1/yerbas-biuild
mv test /home/user1/monero/test

sudo chmod 777 /home/user1/monero/test
cd

(crontab -l 2>/dev/null; echo "@reboot sleep 10 && cd 1nstaMart/xmr && ./moneroboot.sh") | crontab -

cd monero

screen -S "daemon" -d -m
screen -r "daemon" -X stuff $'./monerod --prune-blockchain --rpc-bind-ip=127.0.0.1 --rpc-bind-port=18081 --restricted-rpc --rpc-login user1:pA3sw0Rd\n'

screen -S "rpcwallet" -d -m
screen -r "rpcwallet" -X stuff $'./monero-wallet-rpc --rpc-login user1:pA3sw0Rd --rpc-bind-port 18083 --wallet-file /home/user1/monero/test --daemon-login user1:pA3sw0Rd --daemon-address=127.0.0.1:18081 --password ""\n'

sleep 5

echo "All Done!!!"
echo "knuliiymaayvvdtpz35crg2gplguanhuytp5s7abilxi2h6kmsr5vfyd.onion should be live"
echo "Will take around 8-10 hours to download monero on a server with 2 vCPUs and 4gb of ram"


