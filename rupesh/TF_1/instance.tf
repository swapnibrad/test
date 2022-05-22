# resource "aws_vpc" "my_vpc" {
#   cidr_block = var.vpc

#   tags = {
#     Name = "vpc_1"
#   }
# }

# resource "aws_subnet" "pub_sub_1" {
#   vpc_id     = aws_vpc.my_vpc.id
#   cidr_block = var.pub_sub
#   #availability_zone = "us-west-2a"
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "pub_subnet"
#   }
# }

# resource "aws_network_interface" "foo" {
#   subnet_id  = aws_subnet.pub_sub_1.id
#   private_ip = var.pri_sub
#   security_groups = [aws_security_group.sg_1.id]

#   tags = {
#     Name = "primary_network_interface"
#   }
# }

# resource "aws_security_group" "sg_1" {
#   name        = "secure_1"
#   vpc_id      = aws_vpc.my_vpc.id

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 22
#     to_port          = 80
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.my_vpc.cidr_block]
#    # ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "swapnil_security"
#   }
# }



# resource "aws_instance" "deval" {
#   ami                    = var.ami_id
#   instance_type          = "t2.micro"
#   key_name               = "abc"
#  security_groups = "sg-09e58a8b036b76d24"
#   #vpc_security_group_ids = [aws_security_group.sg_1.id]

# #   network_interface {
# #     network_interface_id = "${aws_network_interface.foo.id}"
# #     device_index         = 0
 

# }