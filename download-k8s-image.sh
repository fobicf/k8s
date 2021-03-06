#!/usr/bin/env bash

images=(
    kube-proxy-amd64:v1.7.6
    kube-controller-manager-amd64:v1.7.6
    kube-apiserver-amd64:v1.7.6
    kube-scheduler-amd64:v1.7.6
    kubernetes-dashboard-amd64:v1.7.0
    k8s-dns-sidecar-amd64:1.14.4
    k8s-dns-kube-dns-amd64:1.14.4
    k8s-dns-dnsmasq-nanny-amd64:1.14.4
    etcd-amd64:3.0.17
    pause-amd64:3.0
	kubernetes-dashboard-init-amd64:v1.0.0
)

for imageName in ${images[@]} ; do
    docker pull docker.io/fobicf/$imageName
    docker tag docker.io/fobicf/$imageName gcr.io/google_containers/$imageName
    docker rmi docker.io/fobicf/$imageName
done
