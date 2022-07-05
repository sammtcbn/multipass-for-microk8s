#!/bin/bash
function del_instance()
{
  for instance in "$@"
  do
    echo multipass delete $instance
    multipass delete $instance
  done
}

del_instance node1 node2 node3

echo multipass purge
multipass purge

echo multipass list
multipass list
