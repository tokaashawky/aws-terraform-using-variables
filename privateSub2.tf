resource "aws_subnet" "PrivateSubnet2" {
  vpc_id     = aws_vpc.MyVPC.id
  cidr_block = "10.10.4.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "PrivateSubnet2"
  }
}