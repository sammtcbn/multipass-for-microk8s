#!/bin/bash
source ./cfg.bash

function create_instance()
{
  for instance in "$@"
  do
    echo multipass launch -c 2 -m 2G -d 8G -n $instance
    multipass launch -c 2 -m 2G -d 8G -n $instance
  done
}

echo sudo snap install multipass --classic
sudo snap install multipass --classic

#create_instance node1 node2 node3
create_instance ${AllInstances}

echo multipass list
multipass list
