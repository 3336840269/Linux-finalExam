id=$1
name=$2
passwd=$3

sudo yum install -y rsync
sudo yum install -y rsync-daemon

sudo sed -i '6,$s/# //g' /etc/rsyncd.conf
sudo sed -i '$d' /etc/rsyncd.conf
sudo sed -i '$d' /etc/rsyncd.conf
sudo sed -i '$d' /etc/rsyncd.conf
sudo sed -i 's/nobody/${id}/' /etc/rsyncd.conf
sudo sed -i '$a read only = no' /etc/rsyncd.conf
sudo sed -i '$a fake super = yes' /etc/rsyncd.conf
sudo bash -c ' echo "
[module-a]
        path = /folder-a
        comment = ftp export area
#       虚拟用户名
        auto users = rsync_a
#       虚拟用户密码文件
        secrets file = /etc/rsyncPasswd.password
'\''  >> /etc/rsyncd.conf '
sudo bash -c 'echo '\'' rsync_a:123'\'' > /etc/rsyncPaaawd.password'
 sudo systemctl enable --now rsyncd
