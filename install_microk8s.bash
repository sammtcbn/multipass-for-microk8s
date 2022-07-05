#!/bin/bash
source ./cfg.bash

function install_mk8s()
{
  for instance in "$@"
  do
    echo multipass exec $instance -- sudo snap install microk8s --classic --channel=1.23/stable
    multipass exec $instance -- sudo snap install microk8s --classic --channel=1.23/stable

    echo multipass exec $instance -- sudo usermod -a -G microk8s ubuntu
    multipass exec $instance -- sudo usermod -a -G microk8s ubuntu

    echo multipass exec $instance -- sudo chown -f -R ubuntu ~/.kube
    multipass exec $instance -- sudo chown -f -R ubuntu ~/.kube
  done
}

function wait_mk8s_ready()
{
  for instance in "$@"
  do
    echo multipass exec $instance -- microk8s status --wait-ready
    multipass exec $instance -- microk8s status --wait-ready
  done
}

function basic_addon_install()
{
  for instance in "$@"
  do
    echo multipass exec $instance -- microk8s enable storage dns helm3	  
    multipass exec $instance -- microk8s enable storage dns helm3
  done
}

function alias_config()
{
  for instance in "$@"
  do
    echo multipass exec $instance -- sudo snap alias microk8s.kubectl kubectl
    multipass exec $instance -- sudo snap alias microk8s.kubectl kubectl

    echo multipass exec $instance -- sudo snap alias microk8s.helm3 helm
    multipass exec $instance -- sudo snap alias microk8s.helm3 helm

    echo multipass exec $instance -- sudo snap alias microk8s.ctr ctr
    multipass exec $instance -- sudo snap alias microk8s.ctr ctr
  done
}

install_mk8s ${AllInstances}
wait_mk8s_ready ${AllInstances}
basic_addon_install ${AllInstances}
wait_mk8s_ready ${AllInstances}
alias_config ${AllInstances}

