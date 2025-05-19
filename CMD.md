>> check autosave of vscode
>> in aws create aws IAM user an create access key
    aws configure
    cat ~/.aws/credentials
    terraform init
    terraform apply 
    terraform destroy
=============================================================================================
# terraform aws backend:
-- By default, Terraform stores the .tfstate file locally (in your project folder).
-- To store it remotely and safely, you configure a backend — commonly S3 in AWS.
    terraform {
    backend "s3" {
        bucket = "aws-terraform-backend-statefile" # Your S3 bucket name
        key    = "terraform.tfstate"               # Path within the bucket
        region = "us-east-1"                       # Bucket region
        }
    }
Even if you defined AWS profile in the provider, you still need to authenticate separately for the backend
 You must manually create the S3 bucket before running  <terraform init --reconfigure>
 Terraform does not create the backend bucket for you
=============================================================================================
# NOTICE
Changing the Backend When State Already Exists
Terraform checks if there's already a local terraform.tfstate file, and a new backend (like S3) is defined.
Terraform will ask: “Do you want to copy the existing state to the new backend (S3)?”
If you say <yes>: Terraform uploads the local .tfstate to S3
⚠️ If that key (terraform.tfstate) already exists in the S3 bucket, it will be replaced
✅ Best Practices: Enable versioning in S3
    to protect your state file from: Accidental deletion, Overwrites, Corruption
=============================================================================================
# NOTICE
If you were a team
sharing an S3 bucket without proper locking can lead to serious problems in a team.
If two people run terraform apply at the same time using the same state file in a shared S3 bucket:
One person might override the other’s changes
It can result in state corruption, resource drift, or unexpected infrastructure deletion
✅ Solution: State Locking
# What is State Locking?
State Locking is used to prevent multiple people or processes from modifying the same Terraform state file
at the same time — especially important when using remote backends like 
1- Enabling DynamoDB State Locking (Deprecated) ---> dynamodb is serverless
dynamodb_table - (Optional, Deprecated) Name of the DynamoDB Table to use for state locking and consistency.
The table must have a partition key named LockID with a type of String.
    Use an S3 bucket for your remote state
    Create a DynamoDB table for locking
    terraform {
        backend "s3" {
            bucket         = "my-terraform-state"
            key            = "dev/terraform.tfstate"
            region         = "us-east-1"
            dynamodb_table = "table_name_in_dynamodb" 
        }
    }
    -----------------------------------------------------------------------
    1- go to dynamodb service and create table 
    2- while creating the table set the partition key LockID
    3- create table and wait to be active 
    4- terraform init - reconfigure
    if you try again to make two apply in same time one of them would give:
        Error acquiring the state lock
        at this step if you explore the table you would see a record contain info about who now apply 
    --- Notice if you close your window while apply the lock will still exist 
        1- you should go to the table and remove the lock manually(if you have permissions)
        2- when you make apply it will appear in the error ID of the lock
               terraform force-unlock lock-id --->>> from terminal(you don't need to have permissions)
    when apply you now should see first:
        Acquiring state lock, This may take a few moments...

2- Enabling S3 State Locking
To enable S3 state locking, use the following optional argument:
use_lockfile - (Optional) Whether to use a lockfile for locking the state file. Defaults to false.
use_lockfile = true
=============================================================================================
# NOTICE
1- Keep a resource in AWS (e.g. a VPC) but remove it from Terraform's control (won’t destroy it on apply).
    Don’t delete it from AWS
    Don’t just delete it from your code — that will make Terraform destroy it
    Instead, remove it from the state file using: <terraform state rm aws_vpc.my_vpc>
    ✅ Useful when your company decides to manage that resource manually.

2- You already have a resource in AWS (e.g. subnet, VPC), and now you want Terraform to manage it.
    Write the Terraform code with the same configuration (CIDR, region, tags, etc.) 
    that matches the existing AWS resource. <terraform import aws_subnet.main subnet-abc123>
Run terraform plan to verify everything matches. If it doesn’t, Terraform might try to change something.
=============================================================================================
terraform state list	                # List all resources tracked in the state
terraform state show aws_subnet.main	# Show details of one resource
terraform state pull	                # Show the entire raw state file
terraform state rm <resource>       	# Remove resource from the state (no deletion in AWS)
terraform import <resource> <id>	    # Import AWS resource into Terraform

terraform graph	    # your infrastructure as a dependency graph (can render with Graphviz)
terraform fmt	    # Format your Terraform code cleanly and consistently
=============================================================================================
