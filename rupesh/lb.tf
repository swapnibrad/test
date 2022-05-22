resource "aws_lb" "test" {
  name               = "test-lb-tf"
 # internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.r_1.id]
  subnets            = ["subnet-0ac2dc767f9ba8496","subnet-03121b91385274240"]

  #enable_deletion_protection = true

#   access_logs {
#     bucket  = aws_s3_bucket.lb_logs.bucket
#     prefix  = "test-lb"
#     enabled = true
#   }

  tags = {
    Environment = "production"
  }
}