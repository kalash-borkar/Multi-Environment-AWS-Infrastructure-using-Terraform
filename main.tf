# modules

# dev

module "dev-application" {
  source = "./aws_modules"
  my_env = "dev"
  instance_type = "t3.micro"
  ami_id = "ami-01a00762f46d584a1"
  instance_count = 1
}

# Staging

module "Staging-application" {
  source = "./aws_modules"
  my_env = "stg"
  instance_type = "t3.micro"
  ami_id = "ami-01a00762f46d584a1"
  instance_count = 2
}

# Production

module "Production-application" {
  source = "./aws_modules"
  my_env = "prod"
  instance_type = "t3.micro"
  ami_id = "ami-01a00762f46d584a1"
  instance_count = 3
}