#!/bin/bash

virt-install --ram 16384 --vcpus 8 --os-variant rhel7.7 --disk size=100 --cdrom=/var/lib/libvirt/images/rhel-8.1-x86_64-dvd.iso --network network:oam --network network:internal --network bridge:br0 --name undercloud --cpu host
