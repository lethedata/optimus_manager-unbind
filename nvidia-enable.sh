#!/bin/sh

# This script is only executed if you set switching to "custom" in optimus-manager.conf.
# Everything you write here will be executed by optimus-manager as root prior to loading the nvidia kernel modules.
# Use this to set your own commands for powering up the Nvidia GPU.
#system76-power graphics power on

# Unbinds GPU if bound to vfio and removes id to prevent reattach errors

[ -d /sys/bus/pci/drivers/vfio-pci/0000:01:00.0 ] &&
       	echo 0000:01:00.0 > /sys/bus/pci/devices/0000:01:00.0/driver/unbind &&
       	echo 10de 228b > /sys/bus/pci/drivers/vfio-pci/remove_id ;


# Unbinds GPU Audio if bound to vfio and removes id to prevent reattach errors
# Rebinds GPU Audio to snd_hda_intel driver
[ -d /sys/bus/pci/drivers/vfio-pci/0000:01:00.1 ] &&
       	echo 0000:01:00.1 > /sys/bus/pci/devices/0000:01:00.1/driver/unbind &&
       	echo 10de 249d > /sys/bus/pci/drivers/vfio-pci/remove_id &&
       	echo 0000:01:00.1 > /sys/bus/pci/drivers/snd_hda_intel/bind ;
