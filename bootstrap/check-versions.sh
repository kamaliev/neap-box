#!/bin/bash

. /vagrant/resources/colors.sh

# This script needs admin rights
if [ 0 != $(id -u) ]; then
	echox "${text_red}Error:${text_reset} This script must be run as root!"
	exit 1
fi

DEBIAN=$(cat /etc/debian_version)
echo "Debian: $DEBIAN, with:"

VBOXGUESTADDITIONS=$(echo `modinfo vboxguest` | sed 's/.*\bversion: \([^ ]*\).*/\1/')
echo "* VirtualBox Guest Additions: $VBOXGUESTADDITIONS"

LETSENCRYPT=$(echo `letsencrypt --version 2>&1` | sed 's/.*letsencrypt \(.*\)/\1/')
echo "Let's Encrypt: $LETSENCRYPT"

NGINX=$(echo `nginx -v 2>&1` | sed 's/.*nginx\/\(.*\)/\1/')
echo "nginx: $NGINX, with:"

OPENSSL=$(echo `nginx -V 2>&1` | sed 's/.*openssl-\([^ ]*\).*/\1/')
echo "* OpenSSL: $OPENSSL"

NGINX_RTMP=$(echo `nginx -V 2>&1` | sed 's/.*nginx-rtmp-module-\(.*\)/\1/')
echo "* nginx-rtmp-module: $NGINX_RTMP"

REDIS=$(echo `redis-server -v` | sed 's/Redis server v=\([^ ]*\).*/\1/')
echo "Redis: $REDIS"

PHP=$(echo `php -v` | sed 's/PHP \([^-]*\).*/\1/')
echo "PHP: $PHP, with:"

PHPFPM=$(echo `php-fpm7.0 -v` | sed 's/PHP \([^-]*\).*/\1/')
echo "* PHP-FPM: $PHPFPM"

PHPREDIS=$(echo `php -i | grep "Redis Version"` | sed 's/Redis Version => \(.*\)/\1/')
echo "* PhpRedis: $PHPREDIS"

XDEBUG=$(echo `php -v` | sed 's/.*Xdebug v\([^,]*\).*/\1/')
echo "* Xdebug: $XDEBUG"

COMPOSER=$(echo `composer 2>&1` | sed 's/.*Composer version \([^ ]*\).*/\1/')
echo "* Composer: $COMPOSER"

POSTGRESQL=$(echo `psql -V` | sed 's/psql (PostgreSQL) \(.*\)/\1/')
echo "PostgreSQL: $POSTGRESQL"

MAILCATCHER=$(echo `gem list | grep mailcatcher` | sed -r 's/mailcatcher \((.*)\)/\1/')
echo "MailCatcher: $MAILCATCHER"

NPM=$(npm -v)
echo "NPM: $NPM"

FFMPEG=$(echo `ffmpeg -version` | sed 's/.*ffmpeg version \([^ ]*\).*/\1/')
echo "FFmpeg: $FFMPEG"

UNREALIRCD=$(echo `sudo -u irc /etc/unrealircd/bin/unrealircd -v 2>&1` | sed 's/.*UnrealIRCd-\([^ ]*\).*/\1/')
echo "UnrealIRCd: $UNREALIRCD, with:"

ANOPE=$(echo `/etc/anope/bin/services -v` | sed 's/Anope-\([^ ]*\).*/\1/')
echo "* Anope: $ANOPE"