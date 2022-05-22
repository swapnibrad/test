provider "aws" {
  region = "us-east-1"
profile = "saif"
}

resource "aws_iam_user" "user_1" {
  name = "${var.sudhanshu.r_3[1]}"
}

resource "aws_iam_user" "user_2" {
  name = "${var.sudhanshu.r_4.s_3[0]}"
}

resource "aws_iam_group" "group_1" {
  name = "${var.res_4.3}"
}

# resource "aws_iam_group_membership" "add_usr_in_grp" {
#   name = "abc"

#   users = [
#     aws_iam_user.user_1.name,
#     aws_iam_user.user_2.name,
#   ]
#   group = aws_iam_group.group_1.name
# }