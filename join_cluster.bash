#!/bin/bash
#multipass exec node1 -- microk8s add-node --format short | head -1
#multipass exec node1 -- microk8s add-node

function show_node()
{
  echo multipass exec node1 -- kubectl get node
  multipass exec node1 -- kubectl get node
}

function join_cluster()
{
  for instance in "$@"
  do
    cmd=$(multipass exec node1 -- microk8s add-node --format short | head -1)
    #echo ${cmd}
    echo multipass exec $instance -- ${cmd}
    multipass exec $instance -- ${cmd}
  done
}

function wait_all_node_ready()
{
  echo multipass exec node1 -- kubectl wait --for=condition=Ready nodes --all --timeout=600s
  multipass exec node1 -- kubectl wait --for=condition=Ready nodes --all --timeout=600s
}

show_node

echo

join_cluster node2 node3

echo

show_node

echo

wait_all_node_ready

echo

show_node
