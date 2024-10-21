# syntax=docker/dockerfile:1

ARG PROXY_BASIC_AUTH_USER
ARG PROXY_BASIC_AUTH_PASSWORD

FROM ubuntu/squid:latest

RUN echo "${PROXY_BASIC_AUTH_USER}:$(openssl passwd -apr1 ${PROXY_BASIC_AUTH_PASSWORD})" > /etc/squid/passwd
COPY squid.conf /etc/squid/squid.conf
EXPOSE 3128:3128
