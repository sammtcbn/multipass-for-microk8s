#!/bin/bash
source ./cfg.bash

function show_node()
{
  echo multipass exec ${MainInstances} -- kubectl get node
  multipass exec ${MainInstances} -- kubectl get node
}

function join_cluster()
{
  for instance in "$@"
  do
    cmd=$(multipass exec ${MainInstances} -- microk8s add-node --format short | head -1)
    #echo ${cmd}
    echo multipass exec $instance -- ${cmd}
    multipass exec $instance -- ${cmd}
  done
}

function wait_all_node_ready()
{
  echo multipass exec ${MainInstances} -- kubectl wait --for=condition=Ready nodes --all --timeout=600s
  multipass exec ${MainInstances} -- kubectl wait --for=condition=Ready nodes --all --timeout=600s
}

show_node

echo

join_cluster ${MemberInstances}

sleep 5

echo

show_node

echo

wait_all_node_ready

echo

show_node
