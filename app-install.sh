#! /bin/bash
# Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
sudo apt update -y
sudo apt  install -y apache2
sudo systemctl enable apache2
sudo echo '<h1>OneMuthoot -  APP-1</h1>' | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1
sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>OneMuthoot - APP-1</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
sudo useradd -m -d /home/ansible -s /bin/bash ansible
echo "ansible  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ansible
sudo mkdir -p /home/ansible/.ssh
sudo touch /home/ansible/.ssh/authorized_keys
sudo echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBdMrQ4IJ4pq5Cok3Wo+ZIcaJsuezR9Vo0DE5Vj3gUUSlnuB1jxreCsvA63ZDOya6LgbhB1i9Q/XmwhlypCuQhHO5ACiXEqEOosL0SvUJNPPBzW4QhOBxmUhpYF+2+rapRRqZqOax2xPTEERwTInJqQhoNRqg9eo24Mbff3KZHgvtfeRWcrZTUC4DEqkmzpyZ8y50YYk/DrNgSX248bsae+o0+IA/I5cTGd9dBUUXTJhXVuanJ7Ncr6dzhZOm8xG3u3e0SVmcc7yi8LWZxeDQG1B0LctgR3zlHDvmaNITSskEMlF8GQuJghh37BrSDPNthjdA+8WME3+p/3PHLj9/2en3v5rHKKCZr+mBJIZ9gtLGz8GE3TYT+32IBNKfxq3YJMQ+HU4zv38A7l6DACaDmT7l0kzPtWHSPHWIUJiUQm+dljsIHbyyWPhPXUmUSIOzRcrD3Ve5hpy4IHJNXT6Gq+vEW9U/1X6fo79yJb17UN2BqyxP0RprRkTS+mUqyA9c= ansible@ip-172-31-82-215" >> /home/ansible/.ssh/authorized_keys

sudo chown -R ansible:ansible /home/ansible/.ssh

sudo chmod 700 /home/ansible/.ssh

sudo chmod 600 /home/ansible/.ssh/authorized_keys

sudo usermod -a G sudo ansible


