FROM node:lts-alpine3.10 as base

RUN mkdir /srv/app && chown node:node /srv/app

# For security reasons (npm install can run arbitrary scripts), we don't want to run as root - use the non-priviliged
# node user, which comes as standard with node Docker images.
USER node
WORKDIR /srv/app

# We copy the NPM package files in a separate layer (before copying application code) to take advantage of Docker layer
# caching - these files change far less often than the application code.
COPY --chown=node:node consumer/subitogo/package*.json ./

FROM base as develop

# The following dependencies are required for Pact to install correctly
USER root
RUN apk --no-cache add ca-certificates wget bash \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk \
    && apk add glibc-2.29-r0.apk
USER node
RUN npm set progress=false && \
    npm config set depth 0 && \
    npm ci --no-optional
COPY --chown=node:node consumer/subitogo /srv/app
CMD ["npm", "run", "dev"]