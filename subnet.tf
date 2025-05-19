resource "aws_subnet" "PublicSubnet" {
  vpc_id     = aws_vpc.toka.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "PublicSubnet"
  }
}