FROM registry.rosscousens.com:5000/rc/base

RUN git clone https://github.com/rcousens/symfony-php-docker.git /root/app

RUN mkdir -p /var/www/html

RUN cp -R /root/app/code/backend/* /var/www/html

VOLUME /var/www/html