 provider "aws" {
     profile = "user"
     region = "us-west-1"
 }

resource "aws_instance" "r_1" {
  ami           = "ami-009726b835c24a3aa"
 # count = 4
  instance_type = "t2.micro"
   availability_zone  = "us-west-1b"
   security_groups = [aws_security_group.r_1.name]

   #key_name = aws_key_pair.r_1.key_name

  tags = {
    Name = "AWS_LB"
  }
  user_data = <<EOT
                 apt update
                 apt install httpd -y
                 echo "welcome to cloudblitz" >> /var/www/html/index.html
                 systemctl restart httpd
                 systemctl enable httpd
                 EOT
}

#  user_data = <<EOF
# #!/bin/bash
# sudo apt update -y
# sudo apt install default-jre -y
# sudo apt install nfs-common -y
# wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
# sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
# sudo apt update -y
# mkdir -p /var/lib/jenkins
# echo "${aws_efs_file_system.this.dns_name}:/ /var/lib/jenkins nfs4 defaults 0 0" | sudo tee -a /etc/fstab
# sudo apt install jenkins -y
# sudo apt-get install openjdk-8-jdk -y
# sudo chown -R jenkins:jenkins /var/lib/jenkins
# sudo systemctl start jenkins
# EOF   

# #  user_data_node = <<EOF
# # #!/bin/bash
# # sudo apt update -y
# # EOF
# }

resource "aws_security_group" "r_1" {
  name        = "my_secure"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-06760c6ce4bc01789"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
 
 
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   ingress {
    description      = "TLS from VPC"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

# resource "aws_ebs_volume" "r_1" {
#   availability_zone = "us-west-1b"
#   size              = 50
#   tags = {
#     Name = "my_volume"
#   }
# }

# resource "aws_volume_attachment" "r_1" {
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.r_1.id
#   instance_id = aws_instance.r_1.id
# }

# resource "tls_private_key" "r_1" {
#   algorithm   = "RSA"
#   rsa_bits = 4096
# }

# resource "aws_key_pair" "r_1" {
#   key_name   = "demo"
#   public_key = tls_private_key.r_1.public_key_openssh
# }

# resource "aws_efs_file_system" "this" {
#   creation_token = "jenkins-efs"
#   encrypted      = true
#   tags = {
#     Name = "jenkins-efs"
#   }
# }

# resource "aws_efs_mount_target" "this" {
#   file_system_id  = aws_efs_file_system.this.id
#   subnet_id       = aws_instance.r_1.subnet_id
#   security_groups = [aws_security_group.r_1.id]
# }

# resource "aws_efs_access_point" "this" {
#   file_system_id = aws_efs_file_system.this.id
# }

# resource "aws_eip" "this" {
#   instance = aws_instance.r_1.id
#   vpc      = true
# }

# # resource "aws_instance" "node_1" {
# #   #count                       = 1
# #   ami                         = "ami-0851b76e8b1bce90b"
# #   instance_type               = "t3.micro"
# #   associate_public_ip_address = true
# #   key_name                    = aws_key_pair.r_1.key_name
# #   vpc_security_group_ids      = [aws_security_group.r_1.id]
# #   #subnet_id                   = var.subnets_id
# #   #user_data                   = local.user_data_node
# #   tags = {
# #     Name = "1-node"
# #   }
# # }
