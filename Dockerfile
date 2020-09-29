FROM php:7.4
MAINTAINER Jonas Neuhaus <j.neuhaus@nexus-united.com>

RUN apt-get update -y && apt-get install -y libxml2-dev git zip unzip libzip-dev libpng-dev wget mongo-tools && pecl install mongodb && pecl install pcov

RUN docker-php-ext-install zip pdo pdo_mysql intl && docker-php-ext-enable mongodb && docker-php-ext-enable pcov
RUN docker-php-ext-configure gd && docker-php-ext-install -j$(nproc) gd

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php \
 && php -r "unlink('composer-setup.php');" \
 && mv composer.phar /usr/local/bin/composer \
 && chmod +x /usr/local/bin/composer \
 && /usr/local/bin/composer global require hirak/prestissimo
