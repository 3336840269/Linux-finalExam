id=$1
name=$2
passwd=$3

#判断
[[ $# != 3 ]] && echo "请输入合适参数 组ID 用户名 密码" && exit


sudo yum install -y rsync
sudo yum install -y rsync-daemon

sudo sed -i '6,$s/# //g' /etc/rsyncd.conf
sudo sed -i '$d' /etc/rsyncd.conf
sudo sed -i '$d' /etc/rsyncd.conf
sudo sed -i '$d' /etc/rsyncd.conf
sudo sed -i 's/nobody/rsync-a/' /etc/rsyncd.conf
sudo sed -i '$a read only = no' /etc/rsyncd.conf
sudo sed -i '$a fake super = yes' /etc/rsyncd.conf

sudo bash -c " echo '
[module-a]
        path = /folder-a
        comment = ftp export area
#       虚拟用户名
        auto users = ${name}
#       虚拟用户密码文件
        secrets file = /etc/rsyncPasswd.password
'  >> /etc/rsyncd.conf "
sudo bash -c " echo '${name}:${passwd}' > /etc/rsyncPaaawd.password"
sudo useradd -s /sbin/nologin -M ${id}
sudo systemctl enable --now rsyncd
sudo firewall-cmd --add-service=rsyncd
sudo firewall-cmd --add-service=rsyncd --per
sudo chomd 600 /etc/rsyncPaaawd.password
sudo chown -R ${id}:${id} /folder-a
sudo setsebool -P rsync_full_access on
