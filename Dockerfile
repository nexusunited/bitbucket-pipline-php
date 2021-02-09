FROM php:7.2
MAINTAINER Rafal Wesolowski <r.wesolowski@nexus-united.com>, Steven Zemelka <s.zemelka@nexus-united.com>

# Set TIMEZONE
RUN rm /etc/localtime \
    && ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && "date"

RUN apt-get update -y && apt-get install -y libxml2-dev git zip unzip mongo-tools libssl-dev bash jq curl zsh bc wget && pecl install mongodb && pecl install pcov && pecl install xdebug

RUN docker-php-ext-configure soap --enable-soap && docker-php-ext-install soap pdo pdo_mysql && docker-php-ext-enable mongodb && docker-php-ext-enable pcov

RUN wget https://getcomposer.org/composer-1.phar \
 && mv composer-1.phar /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && /usr/local/bin/composer global require hirak/prestissimo





