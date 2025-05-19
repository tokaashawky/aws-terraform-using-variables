# terraform-aws-vpc-backend

This repository contains Terraform code to provision and manage AWS infrastructure, focusing on creating a Virtual Private Cloud (VPC) and related networking resources with a secure, remote backend state management using AWS S3.

## What this project does

- Defines AWS networking resources such as VPC, subnets, and related components.
- Configures a remote backend on AWS S3 to store the Terraform state file securely.
- Implements state locking using DynamoDB to prevent concurrent state changes.
- Includes instructions for initializing, applying, and destroying the infrastructure using Terraform commands.

## Key Features

- Remote Terraform state management with AWS S3 backend
- State locking with DynamoDB to avoid state corruption in team environments
- Best practices for managing Terraform state safely in AWS
- Support for importing existing AWS resources into Terraform control
- Clear instructions for working with Terraform state commands

## How to use

1. Create an AWS IAM user with proper permissions and configure AWS CLI:
   ```bash
   aws configure

2. Create an S3 bucket for Terraform backend and a DynamoDB table for state locking.

3. Initialize Terraform backend: terraform init --reconfigure

4. Apply the Terraform configuration: terraform apply

5. When no longer needed, destroy the infrastructure: terraform destroy

# Notes
Make sure to enable versioning on your S3 bucket to protect the Terraform state file.

Use terraform state commands to manage resources already created outside Terraform or to remove them from Terraform state safely.