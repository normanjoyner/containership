FROM ubuntu:14.04

MAINTAINER ContainerShip Developers <developers@containership.io>

# install packages
RUN apt-get update && apt-get install -y curl g++ git make npm

# install node
RUN npm install -g n
RUN n 0.10.38

# create /app and add files
WORKDIR /app
ADD . /app

# set default NODE_ENV=development
ENV NODE_ENV development

# install dependencies
RUN npm install

# expose ports
EXPOSE 27272 8080

# set entrypoint
ENTRYPOINT ["node", "application.js", "agent"]
