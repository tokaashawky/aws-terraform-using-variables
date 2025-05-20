resource "aws_subnet" "subnets" {
  for_each = { for subnet in var.subnets : subnet.name => subnet }
  vpc_id     = aws_vpc.MyVPC.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone
  map_public_ip_on_launch  = each.value.type == "public" ? true : false
  tags = {
    Name = each.value.name
  }
}
# resource "aws_subnet" "PublicSubnet1" {
#   vpc_id     = aws_vpc.MyVPC.id
#   cidr_block = var.PublicSubnet1_cidr
#   availability_zone = "${var.region}a"
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "PublicSubnet1"
#   }
# }
# resource "aws_subnet" "PublicSubnet2" {
#   vpc_id     = aws_vpc.MyVPC.id
#   cidr_block = var.PublicSubnet2_cidr
#   availability_zone = "${var.region}b"
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "PublicSubnet2"
#   }
# }
# resource "aws_subnet" "PrivateSubnet1" {
#   vpc_id     = aws_vpc.MyVPC.id
#   cidr_block = var.privateSubnet1_cidr
#   availability_zone = "${var.region}a"
#   tags = {
#     Name = "PrivateSubnet1"
#   }
# }
# resource "aws_subnet" "PrivateSubnet2" {
#   vpc_id     = aws_vpc.MyVPC.id
#   cidr_block = var.privateSubnet2_cidr
#   availability_zone = "${var.region}b"
#   tags = {
#     Name = "PrivateSubnet2"
#   }
# }