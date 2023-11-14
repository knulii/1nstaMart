#!/bin/bash

cd
cd monero
screen -S "daemon" -d -m
screen -r "daemon" -X stuff $'./monerod --prune-blockchain --rpc-bind-ip=127.0.0.1 --rpc-bind-port=18081 --restricted-rpc --rpc-login user1:pA3sw0Rd\n'

screen -S "rpcwallet" -d -m
screen -r "rpcwallet" -X stuff $'./monero-wallet-rpc --rpc-login user1:pA3sw0Rd --rpc-bind-port 18083 --wallet-file /home/user1/xmr/test --daemon-login user1:pA3sw0Rd --daemon-address=127.0.0.1:18081 --password ""\n'
