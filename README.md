![containership logo](https://cdn.containership.io/images/CS_TealGreySVG.svg)

## About

### Build Status
[![Build Status](https://drone.containership.io/api/badges/containership/containership/status.svg)](https://drone.containership.io/containership/containership)

### Description
Containership is an open source container management platform which aims to be the simplest way to run containers from dev to production. Containership provides all the necessary pieces to your infrastructure including loadbalancing, service-discovery and DNS in a single package. Extending the core functionality is easy through the use of plugins. Find more detailed docs below!

### Author
Containership Developers - developers@containership.io

### Demo
[![Containership Demo](https://asciinema.org/a/40576.png)](https://asciinema.org/a/40576)

### Repository Structure
This repository is a minimal wrapper around various other official Containership repositories which comprise the full containership package:

* [`codexd`](https://github.com/containership/codexd) - filesystem snapshotting and replication built atop legiond
* [`containership.api`](https://github.com/containership/containership.api) - containership leader API
* [`containership.core`](https://github.com/containership/containership.core) - core containership functionality
* [`containership.scheduler`](https://github.com/containership/containership.scheduler) - default containership scheduler
* [`legiond`](https://github.com/containership/legiond) - secure distributed event layer for nodejs applications
* [`myriad-kv`](https://github.com/containership/myriad-kv) - distributed key-value store built on top of praetor and legiond
* [`praetor`](https://github.com/containership/praetor) - leader election framework built atop LegionD
* [`quarry`](https://github.com/containership/quarry) - rock solid, dynamic DNS server with swappable backends and API

### Plugins
The containership plugin system allows for the core of containership to be overridden by third party plugins. Below are a few official plugins created by Containership:

* [`cloud`](https://github.com/containership/containership.plugin.cloud) - connects cluster to SaaS Containership Cloud product for easier management, cluster backups, etc
* [`cloud-hints`](https://github.com/containership/containership.plugin.cloud-hints) - automatically set cloud metadata in the form of host tags
* [`firewall`](https://github.com/containership/containership.plugin.firewall) - firewall plugin for containership
* [`logs`](https://github.com/containership/containership.plugin.logs) - application log aggregator
* [`navigator`](https://github.com/containership/containership.plugin.navigator) - web-ui for managing your containership clusters
* [`service-discovery`](https://github.com/containership/containership.plugin.service-discovery) service discovery plugin for containership
* [`tide`](https://github.com/containership/containership.plugin.tide) - cron-like job scheduler

## Getting Started

### How do I install Containership locally?
`npm install containership -g`

### Can I spin up a cluster locally?
Absolutely! First install [Vagrant](https://www.vagrantup.com), then install our [cloud plugin](https://github.com/containership/containership.plugin.cloud) by running `cs plugin add cloud`. Once installed, run `cs cloud create-cluster vagrant --leaders 1 --followers 2` to bring up a local cluster to play around with.

### This is pretty cool, how can I get a production cluster setup?
Containership will run on any linux host with node & docker (see [our installation guide](https://containership.readme.io/docs/installation) for more details). If you're using open source Containership, use our [official setting up your first cluster guide](https://containership.readme.io/docs/setting-up-your-first-cluster). If you'd like to manage your Containership cluster using our Containership Cloud management product, sign up for an account and follow the official [getting started guide](https://docs.containership.io/getting-started).

### How can I make modifications to Containership locally?
Read more about [local development](dev/README.md)

## Support & Community
* Join our [Slack Community](https://slack.containership.io)
* Consult our [official documentation](https://docs.containership.io)
* [Open an issue](https://github.com/containership/containership/issues/new)
* Reach out to our [support team](mailto:support@containership.io)

## Contributing
Pull requests and issues are encouraged! Help us make Containership even more awesome :)
