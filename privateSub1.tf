resource "aws_subnet" "PrivateSubnet1" {
  vpc_id     = aws_vpc.MyVPC.id
  cidr_block = "10.10.3.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "PrivateSubnet1"
  }
}