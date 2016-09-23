pull:
	docker pull nginx:latest
	docker pull php:5.6-fpm
	docker pull mysql:latest
	docker pull redis:latest
	docker pull memcached:latest
	docker pull node:latest

dl:
	wget https://github.com/phalcon/cphalcon/archive/phalcon-v2.0.13.tar.gz -O php/cphalcon.tgz
	wget https://pecl.php.net/get/redis-2.2.8.tgz -O php/redis.tgz
	wget https://pecl.php.net/get/memcached-2.2.0.tgz -O php/memcached.tgz
	wget https://pecl.php.net/get/memcache-2.2.7.tgz -O php/memcache.tgz
	wget https://pecl.php.net/get/xdebug-2.4.1.tgz -O php/xdebug.tgz
	wget https://pecl.php.net/get/xhprof-0.9.4.tgz -O php/xhprof.tgz
	wget https://pecl.php.net/get/msgpack-0.5.7.tgz -O php/msgpack.tgz
	wget https://getcomposer.org/composer.phar -O php/composer.phar

build:
	make build-nginx
	make build-mysql
	make build-php
	make build-node

build-nginx:
	docker build -t eric/nginx ./nginx

run-nginx:
	docker run -i -d -p 80:80 -v ~/opt:/opt -t eric/nginx

in-nginx:
	docker run -i -p 80:80 -v ~/opt:/opt -t eric/nginx /bin/bash

build-php:
	docker build -t eric/php ./php

run-php:
	docker run -i -d -p 9000:9000 -v ~/opt:/opt -t eric/php

in-php:
	docker run -i -p 9000:9000 -v ~/opt:/opt -t eric/php /bin/bash

build-mysql:
	docker build -t eric/mysql ./mysql

run-mysql:
	docker run -i -d -p 3306:3306 -v ~/opt/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t eric/mysql

in-mysql:
	docker run -i -p 3306:3306  -v ~/opt/data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -t eric/mysql /bin/bash

build-node:
	docker build -t eric/node ./node

run-node:
	docker run -i -d -p 8001:8001 -v ~/opt:/opt -t eric/node

in-node:
	docker run -i -p 8001:8001 -v ~/opt:/opt -t eric/node /bin/bash

clean:
	docker rmi -f $(shell docker images | grep "<none>" | awk "{print \$3}")
