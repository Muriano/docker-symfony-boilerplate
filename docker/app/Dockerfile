FROM php:7.3-fpm

MAINTAINER José Antonio Muriano Criado <jamuriano@gmail.com>

# Install common utilities
RUN apt-get update \
 && apt-get install -y \
    wget \
    git \
    zlib1g-dev \
    libzip-dev \
    unzip

# Install PHP extensions
RUN docker-php-ext-install zip

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
 && php composer-setup.php --install-dir=/usr/local/bin --filename=composer\
 && php -r "unlink('composer-setup.php');"

# Install prestissimo for composer.
RUN composer global require hirak/prestissimo

# Install Symfony binary
RUN wget https://get.symfony.com/cli/installer -O - | bash \
 && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN mkdir /app

WORKDIR /app