FROM node:lts-alpine


RUN apk add jq && adduser -s /bin/bash -D app && chown -R app /usr/local/lib/node_modules && chown -R app /usr/local/bin && \
	mkdir -p /builder/home/.wrangler && chmod 777 /builder/home/.wrangler

USER app

WORKDIR /home/app

RUN npm install @cloudflare/wrangler -g --unsafe-perm=true --allow-root

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

CMD ["npx", "wrangler"]
