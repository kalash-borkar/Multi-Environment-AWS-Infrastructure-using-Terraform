# variables

variable "dynamo_table_name" {
  type = string
  default = "my-table-dynamo"
  description = "This is my name for dynamodb"
}   

# Ami id

variable "ami_id" {
  default = "ami-01a00762f46d584a1"
  type = string
  description = "This is ami id for ec2"
}

# Instance type

variable "instance_type" {
  default = "t3.micro"
  type = string
  description = "This is instance type for ec2"
}