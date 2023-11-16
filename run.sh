#!/bin/bash

echo "1nstaMart Setup"
sleep 1
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "\r\nProvided by the awesome ${BLUE}knulii${NC}\r\n"

echo -n "Enter the special code or any other key to continue "
echo "."
echo "php 7.2 master = 1"
echo "php 7.2 v3.0 with modules = 2"
echo "php 8.1 branch 3.1 = 3"
echo "php 8.1 branch 3.3 = 4"
read number

if [ $number -eq 1 ]
then
cd scripts
chmod 777 /finish/7fini.sh
mv 7fini.sh /root/1nstaMart/fini.sh
chmod -R uga+rwx master.sh
./master.sh

elif [ $number -eq 2 ]
then
cd scripts
chmod 777 /finish/7mfinish.sh
mv master.sh /root/1nstaMart/fini.sh
chmod -R uga+rwx v3m.sh
./v3m.sh

elif [ $number -eq 3 ]
then
cd scripts
chmod 777 /finish/finish81-1.sh
mv finish81-1.sh /root/1nstaMart/fini.sh
chmod -R uga+rwx php8v31.sh
./php8v31.sh

elif [ $number -eq 4 ]
then
cd scripts
chmod 777 /finish/83.sh
mv 83.sh /root/1nstaMart/fini.sh
chmod -R uga+rwx 83.sh
./83.sh

else
echo "Try again ;)"
fi
