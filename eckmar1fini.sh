#!/bin/bash

sleep 1
echo "Lets finish this"

sleep 5

sudo chmod -R uga+rwx /home/user1/1nstaMart
sudo mv .env /var/www/eckmar/

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

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
composer update
composer install
npm install
npm run prod
php artisan key:generate
CACHE_DRIVER=redis
echo "Almost Done!!!"
php artisan migrate
php artisan storage:link

sudo rm -r /etc/nginx/sites-available/default
sudo mv /etc/nginx/sites-available/default1 /etc/nginx/sites-available/default

sudo service nginx restart


cd
cd 1nstaMart/xmr
./monero.sh



