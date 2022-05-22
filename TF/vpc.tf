# resource "aws_vpc" "main" {
#     #cidr_block    = "172.68.0.0/16"
#   cidr_block    = "${var.cidr.vpc_cidr}"
#   tags = {
#     Name = "main"
#     Env  = "${var.env}"
#   }
# }

# resource "aws_subnet" "public" {
#   vpc_id     = aws_vpc.main.id
#   tags = {
#     Name = "Public"
#   }
#    cidr_block       = "${var.cidr.sub_pub}"
#    map_public_ip_on_launch = "true" 
# }

# resource "aws_subnet" "Private" {
#   vpc_id     = aws_vpc.main.id
#   tags = {
#     Name = "Private"
#   }
#   cidr_block       = "${var.cidr.sub_pri}"
# }

