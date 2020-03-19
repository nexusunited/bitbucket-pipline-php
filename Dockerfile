FROM php:7.2
MAINTAINER Rafal Wesolowski <r.wesolowski@nexus-united.com>, Steven Zemelka <s.zemelka@nexus-united.com>, Jonas Hoppe <j.hoppe@nexus-united.com>

RUN apt-get update -y && apt-get install -y libxml2-dev rsync git zip unzip python3 python3-pip tar nodejs npm rsync

RUN docker-php-ext-configure dom --enable-dom && docker-php-ext-install dom

RUN docker-php-ext-configure json --enable-json && docker-php-ext-install json

RUN docker-php-ext-configure xml --enable-xml && docker-php-ext-install xml

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');" \
 && mv composer.phar /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && /usr/local/bin/composer global require hirak/prestissimo

RUN npm install -g yarn
