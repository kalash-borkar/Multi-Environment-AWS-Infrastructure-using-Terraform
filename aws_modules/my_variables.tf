# variables 

variable "my_env" {
  description = "This is environment for infra"
  type = string
}

# AMI 

variable "ami_id" {
  description = "This is ami id for ec2"
  type = string
}

# Instance type

variable "instance_type" {
  description = "This is instance type for ec2"
  type = string
}

# instances

variable "instance_count" {
  description = "This is count of instances"
  type = number
}