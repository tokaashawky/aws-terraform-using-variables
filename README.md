# Terraform AWS VPC and EC2 Infrastructure

## 📌 Overview
This Terraform project provisions a complete and secure AWS networking and compute infrastructure. It includes a VPC, public and private subnets, EC2 instances, SSH key automation with Secrets Manager, security groups, NAT gateways, route tables, and more.

---

## 📁 Project Structure

| File | Description |
|------|-------------|
| `vpc.tf` | Defines the main Virtual Private Cloud |
| `subnets.tf` | Uses `for_each` to dynamically create public/private subnets |
| `pub-route-table.tf` / `priv-route-table.tf` | Route table definitions |
| `internet-gateway.tf` | Attaches an IGW to the VPC |
| `nat.tf` | Sets up NAT Gateway for private subnets |
| `SGs.tf` | Security groups for SSH and custom app ports |
| `EC2s.tf` | Launches EC2 instances and associates them with subnets and security groups |
| `key.tf` | Generates a TLS SSH key pair and stores keys securely in AWS Secrets Manager |
| `outputs.tf` | Outputs subnet IDs, EC2 IPs, and SSH key for inventory use (e.g. Ansible) |
| `provider.tf` | AWS provider configuration |
| `backend.tf` | (Optional) Remote backend setup |
| `variables.tf` | Input variable definitions |
| `terraform.tfvars` / `dev.tfvars` / `prod.tfvars` | Environment-specific variable values |
| `Notes.txt` | Useful Terraform commands and troubleshooting tips |

---

## ✅ Features

- VPC with public and private subnets in multiple AZs.
- Internet Gateway and NAT Gateway for internet access.
- Security Groups for SSH (port 22) and custom app access (e.g. port 3000).
- EC2 instances with automatic SSH key injection.
- SSH key pair (TLS-generated) is stored securely in AWS Secrets Manager.
- Outputs suitable for use in tools like **Ansible inventory**.
- Uses `for_each` to simplify subnet creation and management.

---

## 🚀 How to Use

1. **Initialize Terraform**
   ```bash
   terraform init
   
2. **Preview the changes**
   ```bash
   terraform plan -var-file=dev.tfvars
   
3. **Apply the infrastructure**
   ```bash
   terraform apply -var-file=dev.tfvars
   
4. **Destroy when done**
   ```bash
   terraform destroy -var-file=dev.tfvars

🔐 SSH Key Management
- A 4096-bit RSA key pair is generated using tls_private_key.
- Public key is injected into EC2 instances.
- Both public and private keys are stored in AWS Secrets Manager.

💡 Tips
1. **To re-run provisioners**
   ```bash
   terraform taint null_resource.run

2. **To get a fresh SSH key**
   ```bash
   terraform taint tls_private_key.secret_key_pair
   terraform apply
   
📎 Requirements

Terraform >= 1.0

AWS CLI configured

IAM permissions to manage VPC, EC2, Secrets Manager, etc.

🔧 Use Cases

Dev/test environments with secure SSH access

Ansible or remote automation using Terraform outputs

Multi-AZ infrastructure with modular networking

