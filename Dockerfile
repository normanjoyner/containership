FROM mhart/alpine-node:6.3.0

MAINTAINER ContainerShip Developers <developers@containership.io>

# install required packages
RUN apk --update add build-base git python-dev

# create /app and add files
WORKDIR /app
ADD . /app

# set default NODE_ENV=development
ENV NODE_ENV development

# install dependencies
RUN npm install

# expose ports
EXPOSE 2666
EXPOSE 2777
EXPOSE 8080

# specify volumes
VOLUME /var/log/containership
VOLUME /root/.containership
VOLUME /mnt/codexd
VOLUME /tmp/codexd

# set entrypoint
ENTRYPOINT ["node", "index.js", "agent"]
