#!/bin/bash

echo "Lets finish this"
sleep 1
echo ".."
sleep 1
echo "  .."
sleep 1
echo "    .."
sleep 1
echo "       ........... ..---->"

sudo chmod -R uga+rwx /home/user1/1nstaMart

sudo apt-get install libevent-dev libssl-dev -y
sudo apt-get install -y tor nyx
sudo apt-get install -y vanguards

wget https://dist.torproject.org/tor-0.4.8.1-alpha.tar.gz
tar -xf tor-0.4.8.1-alpha.tar.gz
cd tor-0.4.8.1-alpha
./configure --enable-gpl && make -j12
sudo make install

(crontab -l 2>/dev/null; echo "@reboot sudo tor") | crontab -

cd ..

sudo cp -r nginx/default /etc/nginx/sites-available/default
sudo service nginx restart

sleep 5
sudo cp -r tor/torrc /usr/local/etc/tor/torrc
sudo mkdir /usr/local/etc/tor/hidden_service
sudo cp -r onions/onion1/* /usr/local/etc/tor/hidden_service
sudo chmod 600 /usr/local/etc/tor/hidden_service
sudo tor --list-modules
(crontab -l 2>/dev/null; echo "@reboot sudo tor") | crontab -
sleep 5

git clone https://github.com/knulii/eckmar.git -b v3.0
sudo mv eckmar /var/www/eckmar/
sudo mv .env /var/www/eckmar/
sudo mv nginx/default /etc/nginx/sites-available/default

wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.0.0.deb
sudo dpkg -i elasticsearch-6.0.0.deb

sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch
sleep 15

curl -X GET "localhost:9200"
curl -X PUT "localhost:9200/products"

sudo apt install redis-server -y
sudo sed -i 's/supervised no/supervised systemd/' /etc/redis/redis.conf
sudo systemctl restart redis.service

sudo apt-get install -y nodejs
sudo apt-get install -y npm
sudo apt-get install libpng-dev -y


cd /var/www/eckmar

sudo chown -R www-data:www-data /var/www/eckmar/public
sudo chmod 755 /var/www
sudo chmod -R 755 /var/www/eckmar/bootstrap/cache
sudo chmod -R 755 /var/www/eckmar/storage
sudo chown -R $USER:www-data /var/www/eckmar/storage
sudo chown -R $USER:www-data /var/www/eckmar/bootstrap/cache
sudo chmod -R 775 /var/www/eckmar/storage
sudo chmod -R 775 /var/www/eckmar/bootstrap/cache
sudo mkdir /var/www/eckmar/storage/public/
sudo mkdir /var/www/eckmar/storage/public/products
sudo chmod -R 755 /var/www/eckmar/storage/public/products
sudo chgrp -R www-data /var/www/eckmar/storage/public/products
sudo chmod -R ug+rwx /var/www/eckmar/storage/public/products

composer update
composer install
npm install
npm run prod
php artisan key:generate
CACHE_DRIVER=redis
echo "Almost Done!!!"
php artisan migrate
sudo php artisan storage:link
sudo service nginx restart

cd
cd 1nstaMart/xmr
./monero.sh



