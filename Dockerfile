FROM node:alpine

WORKDIR /app

RUN apk update && apk upgrade && \
  apk add --no-cache bash git openssh

RUN apk --no-cache add tar curl && \
  curl -L https://github.com/Keesromkes/roon-extension-http-api/archive/master.tar.gz | tar xz --strip-components=1 -C /app && \
  npm install && \
  rm -rf /tmp/* /root/.npm

# COPY package*.json ./


# RUN npm install

# COPY . .


EXPOSE 3001

# HEALTHCHECK --interval=1m --timeout=2s \
#   CMD curl -LSs http://localhost:3001 || exit 1

CMD ["node","server.js"]
