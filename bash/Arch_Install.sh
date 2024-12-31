#!/bin/bash
# Script to install ArchLinux

# Varriables
HOSTNAME='ArchSoul'
UserName='msoul'


# Functions
install_packages() {
    local packages=''
}
set_hostname(){
  echo "$1" > /etc/hostname
  echo "Hostname set to: $1"
}
system_check(){
  #verify boot mode
  if [! /sys/firmware/efi/efivars]; then
    echo "UEFI Not avalible, boot from BIOS or CSM required"
  fi
  #Update System Clock
  timedatectl set-ntp true
}
connect_to_net(){

}

# Script Start
if ["$1" == "-h" || "$1" == ""]; then
  echo "Usage: $0 [options]"
  echo "install = Ports Base-devel onto drive"
  echo "configure = blaw blaw blaw"
elif ["$1" == "install"]; then
  system_check()    #inital verification that everything is cool
  connect_to_net()  #connect to the internet
  #Pre-Install Configuring
  #Installing Arch Linux
  #Listing Partitions
elif ["$1" == "configure"]; then

  #Set Timezone
  ln -sT "/usr/share/zoneinfo/Canada/Eastern" /etc/localtime
  hwclock --systohc
  echo "Timezone set to EST"
  #Set Locale
  echo 'LANG="en_US.UTF-8"' >> /etc/locale.conf
  echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
  locale-gen
  echo "Locale Set to en_US.UTF-8"
  #Set Hostname
  set_hostname() $HOSTNAME
  #Set Hosts File
  echo "127.0.0.1 localhost.localdomain localhost" > /etc/hosts
  echo "::1 localhost.localdomain localhost" >> /etc/hosts
  echo "127.0.1.1 $HOSTNAME.localdomain  $HOSTNAME" >> /etc/hosts
  echo "Hosts File Set"
  #Configure Network
  #Set RootPassword
  #Set User
  #Set Bootloader


fi
