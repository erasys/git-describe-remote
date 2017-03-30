FROM alpine
RUN apk update && apk add --no-cache git openssh

COPY docker-entrypoint.sh /usr/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
