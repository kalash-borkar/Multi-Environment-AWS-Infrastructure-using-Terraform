# Key Pair
resource "aws_key_pair" "my_key" {
  key_name   = "Terra_key_ec2"
  public_key = file("C:/Users/kalash/OneDrive/Desktop/Terraform project/terra_key.pub")
}

# Default VPC reference
resource "aws_default_vpc" "default" {}

# Security Group in Default VPC
resource "aws_security_group" "my_sg" {
  vpc_id      = aws_default_vpc.default.id   # 👈 default VPC ka id
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
  ami                    = "ami-01a00762f46d584a1"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.my_key.key_name
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "My_ec2_server"
  }
}

