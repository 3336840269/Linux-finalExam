#! /bin/bash

#定义变量
Num=$1
IP=$2
hostname=$3

#判断
[[ $# != 3 ]] && echo "请输入合适参数 学号 IP hostname" && exit

#设置IP主机名
sudo nmcli con modify ens160 ipv4.addresses 192.168.${Num}.${IP}/24 ipv4.gateway 192.168.${Num}.2 ipv4.dns 192.168.${Num}.2 autoconnect yes ipv4.method manual
sudo nmcli con up ens160
sudo hostnamectl set-hostname ${hostname}

sudo mount /dev/cdrom /mnt
