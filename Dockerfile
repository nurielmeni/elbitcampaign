FROM yiisoftware/yii2-php:7.4-apache

# Install APCu and APC backward compatibility
RUN pecl install apcu \
    && pecl install apcu_bc-1.0.3 \
    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
    && docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini

RUN pecl install xdebug
RUN docker-php-ext-enable xdebug --ini-name 10-docker-php-ext-xdebug.ini
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Change document root for Apache (for backend)
# RUN sed -i -e 's|/app/web|/app/backend/web|g' /etc/apache2/sites-available/000-default.conf
RUN sed -i -e 's|/app/web|/app/public_html|g' /etc/apache2/sites-available/000-default.conf