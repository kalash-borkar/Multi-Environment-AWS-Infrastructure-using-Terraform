# Multi-Environment-AWS-Infrastructure-using-Terraform 🚀

## 📌 Overview
This project provisions AWS infrastructure using Terraform with a **multi-environment setup**:
- **Staging** → 2 EC2 instances
- **Production** → 3 EC2 instances
- Includes Key Pair, Security Group, Default VPC, S3 bucket, and DynamoDB table.

## 🛠️ Features
- Modular design (`aws_modules` folder)
- Environment-specific variables (`instance_count`, `instance_type`, `ami_id`)
- Auto-tagging with environment name + unique index
- Key Pair + Security Group automation
- Default VPC usage

## 📂 Project Structure

Terraform/
├── main.tf              # Module calls (staging, production)
├── variables.tf         # Root variables
├── outputs.tf           # Root outputs
├── providers.tf         # AWS provider config
├── dynamodb.tf          # DynamoDB resource
├── s3.tf                # S3 bucket resource
├── ec2.tf               # EC2 resource (root level)
├── aws_modules/         # Child modules
│   ├── my_instance.tf   # EC2 + SG + Key Pair
│   ├── my_bucket.tf     # S3 bucket module
│   ├── my_table.tf      # DynamoDB module
│   └── my_variables.tf  # Module variables
├── terra_key            # Private key file
├── terra_key.pub        # Public key file
└── README.md            # Documentation


## ⚙️ How to Use
1. **Initialize Terraform**
   ```bash
   terraform init

2. Preview Plan
terraform plan -var-file="envs/staging.tfvars"
terraform plan -var-file="envs/prod.tfvars"

3. Apply Infrastructure

terraform apply -var-file="envs/staging.tfvars"
terraform apply -var-file="envs/prod.tfvars"


🔑 Variables
instance_type → EC2 type (default: t3.micro)

ami_id → AMI ID for EC2

instance_count → Number of instances per environment

my_env → Environment name (stg, prod)



📤 Outputs
After apply, Terraform will print:

EC2 Instance IDs

Public IPs

Security Group ID

S3 bucket name

DynamoDB table name
