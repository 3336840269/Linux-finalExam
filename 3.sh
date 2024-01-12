lsblk
sudo fdisk /etc/nvme0n6
sudo pvs
sudo pvcreate /dev/nvme0n6p1
sudo vgs
sudo vgextend /dev/rhel /dev/nvme0n6p1
sudo lvs
sudo lvextend -L 19G /dev/rhel/root
sudo lvs
