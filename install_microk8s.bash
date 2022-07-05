#!/bin/bash
echo multipass exec node1 -- sudo snap install microk8s --classic --channel=1.23/stable
multipass exec node1 -- sudo snap install microk8s --classic --channel=1.23/stable

echo multipass exec node2 -- sudo snap install microk8s --classic --channel=1.23/stable
multipass exec node2 -- sudo snap install microk8s --classic --channel=1.23/stable

echo multipass exec node3 -- sudo snap install microk8s --classic --channel=1.23/stable
multipass exec node3 -- sudo snap install microk8s --classic --channel=1.23/stable

multipass exec node1 -- sudo usermod -a -G microk8s ubuntu
multipass exec node1 -- sudo chown -f -R ubuntu ~/.kube

multipass exec node2 -- sudo usermod -a -G microk8s ubuntu
multipass exec node2 -- sudo chown -f -R ubuntu ~/.kube

multipass exec node3 -- sudo usermod -a -G microk8s ubuntu
multipass exec node3 -- sudo chown -f -R ubuntu ~/.kube

echo multipass exec node1 -- microk8s status --wait-ready
multipass exec node1 -- microk8s status --wait-ready

echo multipass exec node2 -- microk8s status --wait-ready
multipass exec node2 -- microk8s status --wait-ready

echo multipass exec node3 -- microk8s status --wait-ready
multipass exec node3 -- microk8s status --wait-ready
