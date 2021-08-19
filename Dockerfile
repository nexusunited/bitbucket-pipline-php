FROM php:7.4
MAINTAINER Rafal Wesolowski <r.wesolowski@nexus-united.com>

RUN apt-get update -y && apt-get install -y libxml2-dev git zip unzip libzip-dev libpng-dev wget default-mysql-client rsync curl python3 python3-pip tar nodejs npm
RUN pecl install pcov

RUN docker-php-ext-install zip pdo pdo_mysql mysqli intl && docker-php-ext-enable pcov
RUN docker-php-ext-configure gd && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-configure dom --enable-dom && docker-php-ext-install dom

RUN docker-php-ext-configure json --enable-json && docker-php-ext-install json

RUN docker-php-ext-configure xml --enable-xml && docker-php-ext-install xml

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN npm install -g yarn