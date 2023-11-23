A sloppy yet simple script to set up an 1nstaMart for easy testing

will clean it up someday, but for now it works ;)

This script will install an eckmar based market from head to toe:

run.sh to start

 php8 options will install
tor 0.4.8.1
php 8.1 
laravel 9
elasticsearch 6

Highly scripted and only tested on Ubuntu

Can easily be edited for a nice and portable scrip for testing

Setup will create a market at the onion

knuliiu2zxsqtxy6alotipvdr5wb2bd6q42fktgv6tli6qxiqdohklqd.onion

a monero wallet named test with a password of ""

a mysql database admin account for the market:

    user = test 

    password = pA3sw0Rd

  and a linux user with the name user1, you will enter the passwd in the the script  

to run, start as root with a fresh vps...

    git clone https://github.com/knulii/1nstaMart.git

    cd 1nstaMart

    ./run.sh

follow prompts


will complete with 

user1@---:/root$ 

Then command 

    cd

    cd 1nstaMart

    ./fini.sh

a couple more prompts
then all done :)

You can now go and visit 

knuliiymaayvvdtpz35crg2gplguanhuytp5s7abilxi2h6kmsr5vfyd.onion

Demo site will be here http://knuliixxck5zm5bebv5xjlgyx5ntkqktafffiuwin62nrdsgsuyfo2id.onion/

Script onions

main test and demo onion

knuliixxck5zm5bebv5xjlgyx5ntkqktafffiuwin62nrdsgsuyfo2id.onion

onion1

knuliiymaayvvdtpz35crg2gplguanhuytp5s7abilxi2h6kmsr5vfyd.onion

onion2

knuliiu2zxsqtxy6alotipvdr5wb2bd6q42fktgv6tli6qxiqdohklqd.onion

onion3

knulii3cwkyuhdqtv5bhmy4gyeycqz6hfsr2hr7fxp635ocug5pe27id.onion

You may need to check that the onion1 is available. If not, add your own to onion1 or change line 21 in torit.sh to onion2 or onion3