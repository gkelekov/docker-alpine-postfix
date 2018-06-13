FROM alpine:edge

# Install software

RUN apk --update add bash curl wget perl htop nano findutils net-tools busybox-extras lsof postfix=3.3.0-r3

ADD etc/ssl/certs /etc/ssl/certs
ADD etc/ssl/private etc/ssl/private
ADD etc/postfix /etc/postfix
ADD etc/aliases /etc/
ADD templates/main.cf /etc/postfix/

EXPOSE 25

# Da se izbjegne Warning kod restartanja postfixa jer mu certifikati u /etc/ssl i /var/spool nisu isti
ADD /etc/ssl/certs/ca-certificates.crt /var/spool/postfix/etc/ssl/certs/

CMD [ "/usr/sbin/postfix", "start-fg" ]

