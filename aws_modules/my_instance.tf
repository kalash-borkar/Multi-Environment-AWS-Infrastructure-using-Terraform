# Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "Terra_key_ec2"
  public_key = file("C:/Users/kalash/OneDrive/Desktop/Terraform project/terra_key.pub")
}

# Default VPC reference
resource "aws_default_vpc" "default" {}

# Security Group in Default VPC
resource "aws_security_group" "my_sg" {
  vpc_id      = aws_default_vpc.default.id
  name        = "allow_web"
  description = "Allow web traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance in Default VPC
resource "aws_instance" "my_instance" {
  count                   = var.instance_count
  ami                     = var.ami_id
  instance_type           = var.instance_type
  key_name                = aws_key_pair.my_key.key_name
  vpc_security_group_ids  = [aws_security_group.my_sg.id]

  tags = {
    Name = "${var.my_env}-My_ec2_server-${count.index}"
  }
}   # ✅ yaha closing brace add karna tha
 
