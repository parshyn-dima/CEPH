#!/usr/bin/env bash
sudo cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime
sudo yum -y install chrony python
sudo systemctl enable chronyd
sudo systemctl start chronyd