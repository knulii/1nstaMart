#!/bin/bash

echo "Monero Setup"
sleep 1
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "\r\nProvided by your lovely ${BLUE}knulii${NC} from here. \r\n"
sleep 5

wget https://downloads.getmonero.org/cli/monero-linux-x64-v0.18.3.1.tar.bz2
tar -xf monero-linux-x64-v0.18.3.1.tar.bz2

cp -r monero-x86_64-linux-gnu-v0.18.3.1 /home/user1/monero
mv test /home/user1/monero/test
mv test.keys /home/user1/monero/test.keys
cd ..

(crontab -l 2>/dev/null; echo "@reboot sleep 10 && cd ./1/moneroboot.sh") | crontab -

cd monero

screen -S "daemon" -d -m
screen -r "daemon" -X stuff $'./monerod --prune-blockchain --rpc-bind-ip=127.0.0.1 --rpc-bind-port=18081 --restricted-rpc --rpc-login user1:pA3sw0Rd\n'

screen -S "rpcwallet" -d -m
screen -r "rpcwallet" -X stuff $'/monero-wallet-rpc --rpc-login user1:pA3sw0Rd --rpc-bind-port 18083 --wallet-file /home/user1/monero/test --daemon-login user1:pA3sw0Rd --daemon-address=127.0.0.1:18081 --password ""\n'

sleep 5

echo "All Done!!!"
echo "knuliixxck5zm5bebv5xjlgyx5ntkqktafffiuwin62nrdsgsuyfo2id.onion should be live"
echo "Will take around 8-10 hours to download monero on a server with 2 vCPUs and 4gb of ram"


