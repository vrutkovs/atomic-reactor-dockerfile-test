FROM fedora:latest
MAINTAINER http://fedoraproject.org/wiki/Cloud

RUN dnf -y update && dnf -y install httpd && dnf clean all
RUN echo "Apache" >> /var/www/html/index.html

EXPOSE 80

# Simple startup script to avoid some issues observed with container restart
ADD run-apache.sh /run-apache.sh
RUN chmod -v +x /run-apache.sh

LABEL "Name"="apache" \
      "Version"="0.0.1" \
      "Release"="7" \
      "Architecture"="x86_64" \
      "BZComponent"="testing"

CMD ["/run-apache.sh"]
