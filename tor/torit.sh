#!/bin/bash

apt-get install libevent-dev libssl-dev -y
apt-get install -y tor nyx
apt-get install -y vanguards

wget https://dist.torproject.org/tor-0.4.8.1-alpha.tar.gz
tar -xf tor-0.4.8.1-alpha.tar.gz
cd tor-0.4.8.1-alpha
./configure --enable-gpl && make -j12
make install

cd ..
apt-get update
cd ..

cp -r nginx/default /etc/nginx/sites-available/default
sudo service nginx restart
sleep 10
cp -r tor/torrc /usr/local/etc/tor/torrc
mkdir /usr/local/etc/tor/hidden_service
cp -r onions/onion1/* /usr/local/etc/tor/hidden_service
chmod 600 /usr/local/etc/tor/hidden_service
tor --list-modules
sleep 10

cd

(crontab -l 2>/dev/null; echo "@reboot sudo tor") | crontab -

echo "Now a new user named user1 - create a password for them"

adduser user1
adduser user1 sudo

mv 1nstaMart /home/user1/
su user1
