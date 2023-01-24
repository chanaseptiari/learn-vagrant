dnf update -y
dnf install -y httpd

systemctl start firewalld
systemctl enable firewalld

firewall-cmd --add-service=http --permanent
firewall-cmd --reload

systemctl start httpd
systemctl enable httpd
