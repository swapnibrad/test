# variable "user_id" {
#   default = "swapnil"
# #   default = "swapnil_2"
# #   default = "swapnil_1"
#}

# variable "user_id" {
#     type = list
#     default = ["swap_1","swap_2","swap_3","swap_4"]
  
# }

# resource "aws_iam_user" "cloud_1" {
#   name = "${var.user_id[1]}"
# }

# variable "sg_name" {
#     type = map 
#     default = {
#         1 = "rani"
#         2 = "anjali"
#         3 = "ahinsa"
#         4 = "chieu"
#         5 = "f_of"
#     } 
# }
# resource "aws_security_group" "sg_2" {
#   name        = "${var.sg_name.1}"
#   description = "Allow TLS inbound traffic"   
# }

# output "nord_123" {
#     value = "${aws_iam_user.cloud_1.arn}"
# }

# output "help_123" {
#     value = "${var.user_id[0]}"
# }

# resource "aws_iam_user" "cloud_1" {
#   name = "${var.user}"
# }

# variable "user" {
#     type = number
#     default = 1
# }

# resource "aws_iam_group" "grp_3" {
#     name = "${var.grp.g3}"
# }

# variable  "grp" {
#     type = map(string)
#     default ={
#         g1  =   "group_1"
#         g2  =   "group_2"
#         g3  =   "group_3"
#     }
# }

# resource "aws_security_group" "sg_3" {
#   name = "${var.sec_gp.sg_4.g_4_3.g_4_3_2}"
# }

# variable  "sec_gp" {
#     type = any
#     default ={
#         sg_1  =   "group_1"
#         sg_2  =   ["group_2","group_3","group_4"]
#         sg_3  =   123
#         sg_4  =   {
#                     g_4_1="group_5"
#                     g_4_2="group_6"
#                     g_4_3={
#                         g_4_3_1="group_7"
#                         g_4_3_2="group_8"
#                     }
#                 }
#     }
# }