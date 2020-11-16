FROM scratch
LABEL maintainer="lukasz.kozlowski@pollub.edu.pl"
LABEL description="Przykladowy dockerfile dla serwera apache & php."
ENV PHPVERSION = 7
ADD files/alpine-minirootfs-3.12.1-x86_64.tar.gz /
RUN apk add --update apache2 php7-apache2 php7 && \
RUN rm -rf /var/cache/apk/* && \
RUN rm -rf /var/www/localhost/htdocs/index.html && \
RUN echo "<?php phpinfo(); ?>" >  /var/www/localhost/htdocs/index.php && \
RUN chmod 755 /var/www/localhost/htdocs/index.php
EXPOSE 80
ENTRYPOINT ["httpd"]
CMD ["-D", "FOREGROUND"]

