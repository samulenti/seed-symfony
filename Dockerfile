FROM php:7.1.2-apache

RUN apt-get update \
  && apt-get install -y libicu-dev nano\
  && docker-php-ext-install intl mbstring \
  && a2enmod rewrite

COPY app/php.ini /usr/local/etc/php/
COPY app/apache2.conf /etc/apache2/apache2.conf

COPY ./ /var/www/html/

RUN chown -R www-data:www-data /var/www/html/var/cache /var/www/html/var/logs
RUN chmod -R 777 /var/www/html/var/cache /var/www/html/var/logs /var/www/html/var/sessions
