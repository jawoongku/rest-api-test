FROM ubuntu:16.04

RUN sed -i 's/archive.ubuntu.com/mirror.kakao.com/g' /etc/apt/sources.list

RUN apt-get clean \
    && apt-get -y update \
    && apt-get install -y --no-install-recommends \
    locales \
    python-software-properties \
    software-properties-common \
    && locale-gen en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN add-apt-repository ppa:ondrej/php

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      tzdata \
      apache2 \
      php7.1 \
      php7.1-cli \
      libapache2-mod-php7.1 \
      php7.1-gd \
      php7.1-json \
      php7.1-curl \
      php7.1-mbstring \
      php7.1-mcrypt \
      php7.1-mysql \
      php7.1-redis \
      php7.1-mongodb \
      php7.1-xml \
      php7.1-xsl \
      php7.1-zip \
      composer \
      && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime


COPY run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run
RUN a2enmod rewrite

COPY . /var/www/html

EXPOSE 80 443

CMD ["/usr/local/bin/run" ]
