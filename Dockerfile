FROM nginx:1.19

RUN 	set -x && \
	apt-get update && apt-get upgrade -y && \
	apt-get install -y php-fpm mariadb-server php-mysqli memcached php-memcached vim

COPY conf_files/www.conf /etc/php/7.3/fpm/pool.d/www.conf
COPY conf_files/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf	 
COPY conf_files/ffxivhunts.conf /etc/nginx/conf.d/default.conf
COPY conf_files/30-start-services.sh /docker-entrypoint.d/
COPY conf_files/40-seed-db.sh /docker-entrypoint.d/

RUN 	set -x && \
	mkdir -p /opt/ffxivhunts
	

COPY --chown=nginx app/ /opt/ffxivhunts

# ENTRYPOINT /bin/bash
