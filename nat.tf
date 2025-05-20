# # we didn't lanuch it >> costs money
# resource "aws_eip" "elasticip" {
#   domain = "vpc"
# }

# resource "aws_nat_gateway" "natGateway" {
#   allocation_id = aws_eip.elasticip.id
#   subnet_id     = aws_subnet.PublicSubnet1.id
#   tags = {
#     Name = "natGateway"
#   }
#   # You're using depends_on to ensure the Internet Gateway is created before the NAT Gateway
#   # since the NAT Gateway needs internet access via the public subnet.
#   depends_on = [aws_internet_gateway.IG]
# }
