lsblk
sudo vgcreate vg-a /dev/md5
sudo vgs
sudo lvcreate /dev/vg-a -L 9G -n lv-a
sudo lvs
sudo mkdir /folder-a
sudo mkfs.ext4 /dev/vg-a/lv-a
sudo bash -c 'echo "/dev/vg-a/lv-a  /folder-a       ext4    defaults        0 0" >> /etc/fstab'
sudo mount -a
