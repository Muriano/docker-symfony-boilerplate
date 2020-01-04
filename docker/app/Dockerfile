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
 && php -r "if (hash_file('sha384', 'composer-setup.php') === 'baf1608c33254d00611ac1705c1d9958c817a1a33bce370c0595974b342601bd80b92a3f46067da89e3b06bff421f182') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
 && php composer-setup.php --install-dir=/usr/local/bin --filename=composer\
 && php -r "unlink('composer-setup.php');"

# Install prestissimo for composer.
RUN composer global require hirak/prestissimo

# Install Symfony binary
RUN wget https://get.symfony.com/cli/installer -O - | bash \
 && mv /root/.symfony/bin/symfony /usr/local/bin/symfony

RUN mkdir /app

WORKDIR /app