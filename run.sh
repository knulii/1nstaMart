#!/bin/bash

echo "1nstaMart Setup"
sleep 1
BLUE='\033[1;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color
printf "\r\nProvided by the awesome ${BLUE}knulii${NC}\r\n"

echo -n "What version"

echo "php 7.2 master = 1"
echo "php 7.2 v3.0 with modules = 2"
echo "php 8.1 branch 3.1 = 3"
read number

if [ $number -eq 1 ]
then
./master.sh
elif [ $number -eq 2 ]
then
./v3m.sh
elif [ $number -eq 3 ]
then
./php8v31.sh
else
echo "Try again ;)"
fi
