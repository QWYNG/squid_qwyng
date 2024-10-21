# syntax=docker/dockerfile:1.2
FROM ubuntu/squid:latest

RUN --mount=type=secret,id=proxy-basic-auth-user,env=PROXY_BASIC_AUTH_USER \
    --mount=type=secret,id=proxy-basic-auth-passowrd,env=PROXY_BASIC_AUTH_PASSWORD \
    echo "$PROXY_BASIC_AUTH_USER:$(openssl passwd -apr1 $PROXY_BASIC_AUTH_PASSWORD)" > /etc/squid/passwd
COPY squid.conf /etc/squid/squid.conf
EXPOSE 3128:3128
