FROM ubuntu:12.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -q update

RUN apt-get -q install -y -o Dpkg::Options::="--force-confnew"  --no-install-recommends \
    php5 php5-cli php5-curl php5-mysql php5-sqlite php5-mcrypt php-pear \
    php5-fpm php5-json php5-memcache php5-memcached \
    git curl

RUN apt-get -q clean -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /var/cache/apt/*.bin

ADD php-fpm.conf /etc/php5/fpm/php-fpm.conf
ADD www.conf /etc/php5/fpm/pool.d/www.conf

EXPOSE 9000
VOLUME /code
WORKDIR /code
ENTRYPOINT ["php5-fpm"]
