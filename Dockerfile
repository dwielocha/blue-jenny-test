FROM php:7.0-fpm

# Set the right timezone
RUN echo "Europe/Rome" > /etc/timezone

RUN apt-get update && apt-get install -y \
        apt-utils \
        libmcrypt-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        zip \
        git \
        wget \
        iputils-ping \
        net-tools

RUN docker-php-ext-install mcrypt pdo_mysql calendar zip pcntl \
    && docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Install Composer
ADD https://getcomposer.org/installer /tmp/composer-setup.php
RUN php /tmp/composer-setup.php --install-dir /usr/local/bin/ --filename composer \
 && rm /tmp/composer-setup.php
