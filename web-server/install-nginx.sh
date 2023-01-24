dnf update -y
dnf install -y nginx

systemctl start firewalld
systemctl enable firewalld

firewall-cmd --add-service=http --permanent
firewall-cmd --reload

systemctl start nginx
systemctl enable nginx

mv /usr/share/nginx/html/index.html /usr/share/nginx/html/_index.html
cp /vagrant/proxy.conf /etc/nginx/conf.d/

systemctl restart nginx

sudo setsebool -P httpd_can_network_connect on
