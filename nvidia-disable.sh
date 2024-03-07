#!/bin/sh

# This script is only executed if you set switching to "custom" in optimus-manager.conf.
# Everything you write here will be executed by optimus-manager as root after unloading the nvidia kernel modules.
# Use this to set your own commands for powering down the Nvidia GPU.
#system76-power graphics power off

# Lacks checks on vfio-pci bind due to script not being executed twice unless manually run

# Bind GPU to vfio-pci
echo 10de 228b > /sys/bus/pci/drivers/vfio-pci/new_id ;

# If attached, unbind GPU Audio 
[ -d /sys/bus/pci/drivers/snd_hda_intel/0000:01:00.1 ] &&
       	echo 0000:01:00.1 > /sys/bus/pci/devices/0000:01:00.1/driver/unbind

# Bind GPU Audio to vfio-pci
echo 10de 249d > /sys/bus/pci/drivers/vfio-pci/new_id ;
