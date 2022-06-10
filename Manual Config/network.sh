#!/bin/bash
sudo ip addr add 192.168.0.23/24 dev enp0s8
sudo ip link set dev enp0s8 up
sudo ip route add default via 192.168.0.1