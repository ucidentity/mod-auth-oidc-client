FROM httpd:2.4

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    ca-certificates \
    libapache2-mod-auth-openidc && \
    rm -rf /var/lib/apt/lists/*

COPY ./apache/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY ./apache/sites-enabled/ /usr/local/apache2/conf/sites-enabled/

COPY ./apache/ssl/selfsigned.crt /usr/local/apache2/conf/ssl/selfsigned.crt
COPY ./apache/ssl/selfsigned.key /usr/local/apache2/conf/ssl/selfsigned.key

COPY ./public_html/ /usr/local/apache2/htdocs/

EXPOSE 80
EXPOSE 443

CMD ["httpd-foreground"]
