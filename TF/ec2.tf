# provider "aws" {
#   region = "us-east-2"
#   profile = "s2n"
# }

# resource "aws_vpc" "vpc_1" {
#   cidr_block       = "172.68.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_subnet" "Sub_n_1" {
#    vpc_id     = aws_vpc.vpc_1.id
#    cidr_block = "172.68.16.0/20"
#     map_public_ip_on_launch = true
#   tags = {
#     Name = "Main"
#   }
# }


# resource "aws_security_group" "sg_1" {
#   name        = "sg_1"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = aws_vpc.vpc_1.id    

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 0
#     to_port          = 65535
#     protocol         = "tcp"
#     #cidr_blocks      = "172.68.16.0/20"
#     #ipv4_cidr_blocks = [aws_vpc.main.ipv4_cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "main"
#   }
# }

# resource "aws_instance" "inst_2" {
#     ami = "ami-08b6f2a5c291246a0"
#     instance_type = "t2.micro"
#     count = "${length(var.sg_name)}"
#         tags = {
#             Name = "${count.index + 1}"
#             Env = "test" 
#         }
#     key_name = "abc"
#     #region = "us-east-2"
#     availability_zone = "us-east-2c"
#     vpc_security_group_ids = ["sg-0f7aede86d61fa6b3"]
#     #security_groups = [aws_security_group.sg_1.name]
#     subnet_id = "subnet-06c83792b930af37d"
#     user_data = <<EOT
#                 yum install httpd -y
#                 echo "welcome to cloudblitz" >> /var/www/html/index.html
#                 systemctl restart httpd
#                 systemctl enable httpd
#                 EOT
# }


