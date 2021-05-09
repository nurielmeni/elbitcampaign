FROM yiisoftware/yii2-php:7.4-apache

# Install APCu and APC backward compatibility
#RUN pecl install apcu \
#    && pecl install apcu_bc-1.0.3 \
#    && docker-php-ext-enable apcu --ini-name 10-docker-php-ext-apcu.ini \
#    && docker-php-ext-enable apc --ini-name 20-docker-php-ext-apc.ini

#RUN pecl install xdebug
RUN docker-php-ext-enable xdebug --ini-name 10-docker-php-ext-xdebug.ini
COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /app
#RUN pecl install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');"

RUN composer update

# Change document root for Apache (for backend)
# RUN sed -i -e 's|/app/web|/app/backend/web|g' /etc/apache2/sites-available/000-default.conf
RUN sed -i -e 's|/app/web|/app/public_html|g' /etc/apache2/sites-available/000-default.conf