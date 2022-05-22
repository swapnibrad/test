provider "aws" {
  access_key =  "AKIA4T4SMXQBUEFCW7O6"
  secret_key = "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"
  region = "ap-south-1"
}

#  resource "aws_iam_group_membership" "u_g_1" {
#   name = "rajat_grp"
#     users = [
#       aws_iam_user.cloud_1.name,
#       aws_iam_user.cloud_2.name,
#     ]  
#     group = aws_iam_group.grp_1.name
#   }  

# resource "aws_iam_group_membership" "u_g_2" {
#   name = "rajat_grp_1"
#     users = [
#       aws_iam_user.cloud_2.name,
#       aws_iam_user.clouud_3.name,
#     ]  
#     group = aws_iam_group.grp_2.name
#   }
