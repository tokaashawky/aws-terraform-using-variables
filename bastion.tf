resource "aws_instance" "Bastion" {
  ami           = "ami-0e58b56aa4d64231b" 
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  subnet_id = aws_subnet.PublicSubnet1.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name = aws_key_pair.key.key_name
  
  tags = {
    Name = "Bastion"
  }
}