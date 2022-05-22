resource "aws_instance" "server" {
  #count = 2 # create four similar EC2 instances
   ami           = "ami-0e0ff68cb8e9a188a"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.errSG.name]
   availability_zone = "ap-south-1a"
   ebs_volume = [aws_ebs_volume.vol_1.name]
key_name = aws_key_pair.this.key_name

  tags = {
    Name = "Server"
  }
}

resource "aws_security_group" "errSG" {
  name        = "TSG_1"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-0ecee780f1ee98939"

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 80
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
    Name = "deval"
  }
}
resource "aws_ebs_volume" "vol_1" {
   # name        = "vol_1"
  availability_zone = "ap-south-1a"
  size              = 40

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.vol_1.id
  instance_id = aws_instance.server.id
}

resource "aws_key_pair" "this" {
  key_name   = "deployer-key"
  public_key = tls_private_key.this.public_key_openssh
  }

resource "tls_private_key" "this" {
  algorithm   = "RSA"
  rsa_bits = "4096"
}