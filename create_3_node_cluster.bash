#!/bin/bash
sudo snap install multipass --classic
multipass launch -c 2 -m 2G -d 8G -n node1
multipass launch -c 2 -m 2G -d 8G -n node2
multipass launch -c 2 -m 2G -d 8G -n node3
multipass list
