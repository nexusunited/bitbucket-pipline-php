FROM php:7.2
MAINTAINER Rafal Wesolowski <r.wesolowski@nexus-united.com>, Steven Zemelka <s.zemelka@nexus-united.com>

RUN apt-get update -y && apt-get install -y libxml2-dev git zip unzip mongo-tools && pecl install mongodb

RUN docker-php-ext-configure soap --enable-soap && docker-php-ext-install soap pdo pdo_mysql && docker-php-ext-enable mongodb

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');" \
 && mv composer.phar /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && /usr/local/bin/composer global require hirak/prestissimo





