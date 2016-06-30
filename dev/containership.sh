#!/bin/bash

################################################
# controls containershp process in Vagrant boxes
################################################

# ensure vagrant is installed
which vagrant > /dev/null
if [[ $? != 0 ]]; then
  >&2 echo "Could not find vagrant executable. Is it installed?"
  exit $?
fi

case $1 in
start)
  # parse `vagrant status` output
  machines=$(vagrant status | grep -E "^(leader|follower)" | awk -F ' ' '{print $1}')

  # run startContainerShip script
  for machine in $machines; do
    vagrant ssh $machine -c "bash /vagrant/dev/.startContainerShip.sh"
  done
  ;;
stop)
  # parse `vagrant status` output
  machines=$(vagrant status | grep -E "^(leader|follower)" | awk -F ' ' '{print $1}')

  # run stopContainerShip script
  for machine in $machines; do
    vagrant ssh $machine -c "bash /vagrant/dev/.stopContainerShip.sh"
  done
  ;;
restart)
  # parse `vagrant status` output
  machines=$(vagrant status | grep -E "^(leader|follower)" | awk -F ' ' '{print $1}')

  # run stopContainerShip and startContainerShip scripts
  for machine in $machines; do
    vagrant ssh $machine -c "bash /vagrant/dev/.stopContainerShip.sh && bash /vagrant/dev/.startContainerShip.sh"
  done
  ;;
*)
  echo "Invalid argument! Please supply one of: [start, stop, restart]"
  ;;
esac
