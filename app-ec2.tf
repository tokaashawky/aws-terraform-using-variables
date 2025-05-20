resource "aws_instance" "application" {
  ami           = "ami-0e58b56aa4d64231b" 
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  subnet_id = aws_subnet.PrivateSubnet1.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_3000.id]
  key_name = aws_key_pair.key.key_name
  
  tags = {
    Name = "application"
  }
}