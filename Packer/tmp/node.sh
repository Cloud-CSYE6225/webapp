

sudo yum update -y
sudo yum upgrade -y



sudo yum install -y gcc-c++ make
curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -
sudo yum install -y nodejs



sudo yum install unzip
unzip /home/ec2-user/webApp.zip
sudo chmod 755 webApp/
cd ./webApp
sudo npm i
sudo npm i bcrypt


sleep 10
sudo mv /tmp/node.service /etc/systemd/system/node.service

sudo systemctl enable node.service

sudo systemctl start node.service