# public-ip

output "ec2_public_ip" {
  value = aws_instance.my_instance.public_ip  #interpolation for public ip
}

# private ip

output "ec2_private_ip" {
  value = aws_instance.my_instance.private_ip
}

# Availibility zone

output "availibility_zone" {
  value = aws_instance.my_instance.availability_zone
}

# Key Name

output "key_name" {
  value = aws_instance.my_instance.key_name
}
