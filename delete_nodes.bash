#!/bin/bash
echo multipass delete node1
multipass delete node1

echo multipass delete node2
multipass delete node2

echo multipass delete node3
multipass delete node3

echo multipass purge
multipass purge

echo multipass list
multipass list
