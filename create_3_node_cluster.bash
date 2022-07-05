#!/bin/bash
echo sudo snap install multipass --classic
sudo snap install multipass --classic

echo multipass launch -c 2 -m 2G -d 8G -n node1
multipass launch -c 2 -m 2G -d 8G -n node1

echo multipass launch -c 2 -m 2G -d 8G -n node2
multipass launch -c 2 -m 2G -d 8G -n node2

echo multipass launch -c 2 -m 2G -d 8G -n node3
multipass launch -c 2 -m 2G -d 8G -n node3

echo multipass list
multipass list
