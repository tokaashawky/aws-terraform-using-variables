# 🛠️ Terraform AWS Infrastructure Setup

This project provisions AWS infrastructure using **Terraform**. It includes support for:
- Local and remote state management via **S3**
- **State locking** using **DynamoDB**
- Best practices for safe, collaborative Terraform usage

---

## 📁 Project Structure
├── backend.tf # Remote backend configuration (S3 + DynamoDB)
├── provider.tf # AWS provider configuration
├── vpc.tf # VPC resource definition
├── subnet.tf # Subnet configuration
├── terraform.tfstate # Local state file (gitignored)
├── terraform.tfstate.backup
├── .terraform.lock.hcl
├── CMD.md # Notes and command references
├── .gitignore
└── README.md # You're here!
