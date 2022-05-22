provider "aws" {
    profile = "user"
    region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-001986d37ece5b4ab"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
    user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo yum install default-jre -y
sudo apt install nfs-common -y
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt update -y
mkdir -p /var/lib/jenkins
echo "${aws_efs_file_system.this.dns_name}:/ /var/lib/jenkins nfs4 defaults 0 0" | sudo tee -a /etc/fstab
sudo apt install jenkins -y
sudo chown -R jenkins:jenkins /var/lib/jenkins
sudo systemctl start jenkins
EOF

  user_data_node = <<EOF
#!/bin/bash
sudo apt update -y
sudo apt-get install openjdk-8-jdk -y
EOF
}
sudo yum install java-1.8.0-openjdk-devel
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install epel-release
sudo yum install jenkins -y
sudo systemctl start jenkins
