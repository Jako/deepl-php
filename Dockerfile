ARG PHP_VERSION
ARG CI_CONTAINER_REPO
FROM ${CI_CONTAINER_REPO}/php:${PHP_VERSION}
RUN apt-get update -yqq
RUN apt-get install git -yqq

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir /
RUN mkdir /.composer && chmod a+rw /.composer
