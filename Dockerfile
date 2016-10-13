FROM mhart/alpine-node:6.8.0

MAINTAINER ContainerShip Developers <developers@containership.io>

# create /app and add files
WORKDIR /app
ADD . /app

# set default NODE_ENV=development
ENV NODE_ENV development

# install required packages and dependencies
RUN apk --update add build-base git python-dev ruby-dev ruby-irb ruby-bundler ruby-rdoc ca-certificates libffi-dev && npm install && gem install ohai && apk del build-base git python-dev ruby-dev ruby-irb ruby-bundler ca-certificates libffi-dev

# expose ports
EXPOSE 2666
EXPOSE 2777
EXPOSE 8080

# specify volumes
VOLUME /var/run/docker.sock
VOLUME /var/log/containership
VOLUME /root/.containership
VOLUME /opt/containership

# set entrypoint
ENTRYPOINT ["node", "index.js"]
