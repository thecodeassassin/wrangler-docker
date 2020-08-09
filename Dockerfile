FROM node:lts-alpine

RUN adduser -s /bin/bash -D app && chown -R app /usr/local/lib/node_modules; chown -R app /usr/local/bin

USER app

WORKDIR /home/app

RUN npm i @cloudflare/wrangler -g

CMD ["npx", "wrangler"]
