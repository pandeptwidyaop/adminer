FROM dockage/alpine-nginx-php-fpm:latest

ENV ADMINER_VERSION=4.17.1

ADD ./assets ${DOCKAGE_ETC_DIR}

RUN apk update \
    && apk --no-cache add php5-pgsql php5-mysql php5-sqlite3 php5-mssql \
    && ${DOCKAGE_ETC_DIR}/buildtime/install \
    && rm -rf /var/cache/apk/* ${DOCKAGE_ETC_DIR}/buildtime
