resource "aws_vpc" "MyVPC" {  
  cidr_block = var.vpc_cidr
   tags = {
    Name = "MyVPC"          
  }
}

# data "aws_vpc" "selected" {
#   id = "vpc-0220bae7f24985d9c"  # should be created and not managed by terraform
# }