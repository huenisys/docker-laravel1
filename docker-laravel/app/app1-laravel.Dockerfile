FROM ubuntu:18.04

LABEL maintainer="huenisys"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
  && apt install -y sudo \
  && apt install -y gnupg tzdata \
  && echo "UTC" > /etc/timezone \
  && dpkg-reconfigure -f noninteractive tzdata

RUN apt update \
  && apt install -y curl zip unzip git supervisor sqlite3 \
    nginx php7.2-fpm php7.2-cli \
    php7.2-pgsql php7.2-sqlite3 php7.2-gd \
    php7.2-curl php7.2-memcached \
    php7.2-imap php7.2-mysql php7.2-mbstring \
    php7.2-xml php7.2-zip php7.2-bcmath php7.2-soap \
    php7.2-intl php7.2-readline php7.2-xdebug \
    php-msgpack php-igbinary \
  && php -r "readfile('http://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer \
  && mkdir /run/php \
  && apt -y autoremove \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && echo "daemon off;" >> /etc/nginx/nginx.conf

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log

ADD default /etc/nginx/sites-available/default
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
ADD start-container.sh /usr/bin/start-container
RUN chmod +x /usr/bin/start-container

RUN useradd -ms /bin/bash huenisys \
  && usermod -aG www-data huenisys \
  && usermod -aG sudo huenisys

ADD sudoers /etc/sudoers

USER huenisys
RUN cd && mkdir application
VOLUME /home/huenisys/application/storage
WORKDIR /home/huenisys/application

ENTRYPOINT ["start-container"]


