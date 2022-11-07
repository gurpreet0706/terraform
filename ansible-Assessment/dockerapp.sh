#! /bin/bash
echo "installing docker"
sudo apt purge -y apache2
sudo apt-get update
curl -fsSL https://get.docker.com -o get-docker.sh
chmod 777 get-docker.sh
sudo sh ./get-docker.sh
#sudo apt install docker.io 
#udo apt-get remove docker docker-engine docker.io containerd runc
#sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo usermod -aG docker ansible
#sudo docker pull gurpreet0706/springapp:35
sudo docker run -itd --name app -p 80:8080 gurpreet0706/springapp:35
