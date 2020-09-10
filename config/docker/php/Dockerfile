FROM php:7.4-fpm-alpine

# https://github.com/docker-library/php/issues/105#issuecomment-249716758
RUN set -ex \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS imagemagick-dev libtool \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk add --no-cache imagemagick \
    && apk del .phpize-deps \
 	&& apk add --no-cache freetype libpng libjpeg-turbo \
	&& apk add --no-cache --virtual .gd-deps freetype-dev libpng-dev libjpeg-turbo-dev \
	&& docker-php-ext-configure gd --with-freetype --with-jpeg \
  	&& docker-php-ext-install -j$(nproc) gd \
	&& apk del .gd-deps

RUN set -ex \
    && echo "memory_limit = 256M" >> /usr/local/etc/php/conf.d/craft-cms.ini \
    && echo "max_execution_time = 120" >> /usr/local/etc/php/conf.d/craft-cms.ini \
	&& echo "upload_max_filesize = 20M" > /usr/local/etc/php/conf.d/craft-cms.ini \
    && echo "max_input_vars = 1000" >> /usr/local/etc/php/conf.d/craft-cms.ini \
    && echo "post_max_size = 8M" >> /usr/local/etc/php/conf.d/craft-cms.ini

RUN set -ex \
	&& curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

WORKDIR /var/www/project

# Create the storage directory and make it writeable by PHP
RUN mkdir -p /var/www/project/storage && \
    mkdir -p /var/www/project/storage/runtime && \
    chown -R www-data:www-data /var/www/project/storage

# Create the cpresources directory and make it writeable by PHP
RUN mkdir -p /var/www/project/web/cpresources && \
    chown -R www-data:www-data /var/www/project/web/cpresources

WORKDIR /var/www/project

# Force permissions, update Craft, and start php-fpm

# Do a `composer install` without running any Composer scripts
# - If `composer.lock` is present, it will install what is in the lock file
# - If `composer.lock` is missing, it will update to the latest dependencies
#   and create the `composer.lock` file
# This automatic running adds to the startup overhead of `docker-compose up`
# but saves far more time in not having to deal with out of sync versions
# when working with teams or multiple environments
CMD composer install --no-scripts --optimize-autoloader --no-interaction \
    && \
    chown -R www-data:www-data /var/www/project/vendor \
    && \
    chown -R www-data:www-data /var/www/project/storage \
    && \
    php-fpm