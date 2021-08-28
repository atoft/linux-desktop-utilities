#!/bin/bash

# Install nVidia drivers.
# Tested on Fedora 34

sudo dnf -y install akmod-nvidia
sudo dnf -y install xorg-x11-drv-nvidia-cuda
sudo dnf -y update
