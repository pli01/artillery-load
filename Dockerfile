FROM node:8-alpine
ARG http_proxy
ARG https_proxy
ARG no_proxy
ARG npm_registry

# use proxy & private npm registry
RUN if [ ! -z "$http_proxy" ] ; then \
        npm config delete proxy; \
        npm config set proxy $http_proxy; \
        npm config set https-proxy $https_proxy; \
        npm config set no-proxy $no_proxy; \
   fi ; \
   [ -z "$npm_registry" ] || npm config set registry=$npm_registry

RUN npm install -g artillery@1.6.0-2

VOLUME /artillery
WORKDIR /artillery

ENTRYPOINT ["artillery"]
