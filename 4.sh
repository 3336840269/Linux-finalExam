lsblk
sudo vgcreate vg-a /dev/md5
sudo vgs
sudo lvcreate /dev/vg-a -L 9G -n lv-a
sudo lvs
