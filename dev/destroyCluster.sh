#!/bin/bash

######################################
# destroys local containership cluster
######################################

# ensure vagrant is installed
which vagrant > /dev/null
if [[ $? != 0 ]]; then
  >&2 echo "Could not find vagrant executable. Is it installed?"
  exit $?
fi

# stop vagrant boxes
vagrant destroy -f
