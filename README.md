containership
==============

##About

###Build Status
[![Build Status](https://drone.containership.io/api/badges/containership/containership/status.svg)](https://drone.containership.io/containership/containership)

###Description
ContainerShip is an open source container management platform which aims to be the simplest way to run containers from dev to production. ContainerShip provides all the necessary pieces to your infrastructure including loadbalancing, service-discovery and DNS in a single package. Extending the core functionality is easy through the use of plugins. Find more detailed docs below!

###Author
ContainerShip Developers - developers@containership.io

##Getting Started

###How do I install ContainerShip locally?
`npm install containership -g`

###Can I spin up a cluster locally?
Absolutely! First install [Vagrant](https://www.vagrantup.com), then install our [cloud plugin](https://github.com/containership/containership.plugin.cloud) by running `cs plugin add cloud`. Once installed, run `cs cloud create-cluster vagrant --leaders 1 --followers 2` to bring up a local cluster to play around with.

###This is pretty cool, how can I get a production cluster setup?
ContainerShip will run on any linux host with node & docker (see [our installation guide](https://docs.containership.io/docs/installation) for more details). If you're using open source ContainerShip, use our [official setting up your first cluster guide](https://docs.containership.io/docs/setting-up-your-first-cluster). If you'd like to manage your ContainerShip cluster using our ContainerShip Cloud management product, sign up for an account and follow the official [getting started guide](https://docs.containership.io/docs/getting-started).

###I need more help!
Consult our [official documentation](https://docs.containership.io) or reach out to our [support team](mailto:support@containership.io).

##Contributing
Pull requests and issues are encouraged! Help us make ContainerShip even more awesome :)
