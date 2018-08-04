#!/bin/bash -e

install -m 644 files/kubelet.service "${ROOTFS_DIR}/etc/systemd/system/kubelet.service"
install -m 644 files/kubelet.yaml "${ROOTFS_DIR}/etc/kubernetes/kubelet.yaml"


on_chroot << EOF
curl -sSL https://get.docker.com/ | sh
usermod -aG docker pi
wget https://dl.k8s.io/v1.11.1/kubernetes-node-linux-arm.tar.gz
tar xzvf kubernetes-node-linux-arm.tar.gz kubernetes/node/bin/kubelet
systemctl enable kubelet
EOF

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/pi/manifests"
