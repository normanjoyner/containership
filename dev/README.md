# Local Development

## Prerequisites
* VirtualBox
* Vagrant

## Setup
To install containership, all related repositories, and dependencies for local development, use the following curl command:

`bash <(curl -s https://raw.githubusercontent.com/containership/containership/master/dev/dev_init.sh) all`

## Launch a cluster
Launch a local containership cluster using Vagrant machines. Script is configurable with the following parameters:
* `NUM_LEADERS` - number of leaders to launch (defaults to 1)
* `NUM_FOLLOWERS` - number of followers to launch (defaults to 1)
* `LEADERS_MEMORY` - amount of memory (in mb) allocated to leader VMs (defaults to 512)
* `FOLLOWERS_MEMORY` - amount of memory (in mb) allocated to follower VMs (defaults to 2048)

`./dev/createCluster.sh`

## Controlling containership agent
To control the containership agent within the VMs use the following command:

`./dev/containership.sh {start,stop,restart}`

You will need to restart the agent after any changes you make locally.

## Destroying the cluster
To destroy your development cluster, use the following script:

`./dev/destroyCluster.sh`
