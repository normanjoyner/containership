#!/bin/bash

#####################################
# creates local containership cluster
#####################################

# sets variables
BASE_IP=10.10.10
NUM_LEADERS="${NUM_LEADERS:-1}"
LEADERS_MEMORY="${LEADERS_MEMORY:-512}"
NUM_FOLLOWERS="${NUM_FOLLOWERS:-1}"
FOLLOWERS_MEMORY="${FOLLOWERS_MEMORY:-2048}"

# ensure vagrant is installed
which vagrant > /dev/null
if [[ $? != 0 ]]; then
  >&2 echo "Could not find vagrant executable. Is it installed?"
  exit $?
fi

# write Vagrantfile
echo -e "Vagrant.configure(2) do |config|\n" > Vagrantfile

for i in $(seq 1 $NUM_LEADERS); do

LAST_OCTET=$((1+${i}))

cat << EOF >> Vagrantfile
  config.vm.define "leader${i}" do |host|
    host.vm.hostname = "leader${i}"
    host.vm.box = "package.box"
    host.vm.network "private_network", ip: "${BASE_IP}.${LAST_OCTET}"
    host.vm.synced_folder "$(pwd)/../", "/mnt/containership"
    host.vm.provider "virtualbox" do |vb|
      vb.memory = "${LEADERS_MEMORY}"
    end
  end

EOF

done

for i in $(seq 1 $NUM_FOLLOWERS); do

LAST_OCTET=$((1+$NUM_LEADERS+${i}))

cat << EOF >> Vagrantfile
  config.vm.define "follower${i}" do |host|
    host.vm.hostname = "follower${i}"
    host.vm.box = "package.box"
    host.vm.network "private_network", ip: "${BASE_IP}.${LAST_OCTET}"
    host.vm.synced_folder "$(pwd)/../", "/mnt/containership"
    host.vm.provider "virtualbox" do |vb|
      vb.memory = "${FOLLOWERS_MEMORY}"
    end
  end

EOF

done

echo "end" >> Vagrantfile

# start vagrant boxes
vagrant up
