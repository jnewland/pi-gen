#!/bin/bash -e

on_chroot << EOF
curl -sSL https://get.docker.com/ | sh
usermod -aG docker pi
EOF
