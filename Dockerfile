FROM node:lts-alpine


RUN apk add jq && adduser -s /bin/bash -D app && chown -R app /usr/local/lib/node_modules; chown -R app /usr/local/bin

USER app

WORKDIR /home/app

RUN npm i @cloudflare/wrangler -g

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["npx", "wrangler"]
