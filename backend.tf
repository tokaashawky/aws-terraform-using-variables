terraform {
  backend "s3" {
    bucket = "aws-terraform-backend-statefile"
    key    = "terraform.tfstate"
    region = "us-east-1"
    #dynamodb_table = "TableForLock"
    #use_lockfile = true 
  }
}