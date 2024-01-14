#! /bin/bash

OldFile=/boot/grub2
NewFlie=~/backup
Date=$(date +%F)

[ -d ${NewFlie}/${Date} ] || mkdir -p ${NewFlie}/${Date}

DestDir="$(hostname)_$(date +%F-%H-%M)_grub2.tar.gz"

cd ${NewFlie}/${Date} && sudo tar czf ${DestDir} ${OldFile}

export RSYNC_PASSWORD=123
rsync -avz ${DestDir} rsync_a@192.168.35.201::module-a
