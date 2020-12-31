#!/bin/bash

sed -i 's/#force_color_prompt=.*$/force_color_prompt=yes/g' /home/vagrant/.bashrc
sed -i 's/01;34m/01;33m/g' /home/vagrant/.bashrc

echo '======================================='
echo '=== Creating SSH key ...'
echo '======================================='
ssh-keygen -t rsa -N '' -C "vagrant@${HOSTNAME}" -f /home/vagrant/.ssh/id_rsa

echo '======================================='
echo '=== Setting VM to your local timezone ...'
echo '======================================='
export tz=`wget -qO - http://geoip.ubuntu.com/lookup | sed -n -e 's/.*<TimeZone>\(.*\)<\/TimeZone>.*/\1/p'`
sudo timedatectl set-timezone $tz
export tz=`timedatectl status| grep Timezone | awk '{print $2}'`
echo "=== TimeZone set to $tz"

