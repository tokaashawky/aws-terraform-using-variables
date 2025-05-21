resource "aws_instance" "Bastion" {
#   count =  2   # it mean it will create two EC2
#   bastion_count = var.bastion_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id =  aws_subnet.subnets["PublicSubnet1"].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name = aws_key_pair.key.key_name
  
  tags = {
    Name = "Bastion"
    # if you want to create the two machines with different names
    # Name = "Bastion-${count.index}"
    # would be Bastion-0, Bastion-1
  }
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnets["PublicSubnet1"].id
  vpc_security_group_ids = [aws_security_group.allow_ssh_3000.id]
  key_name = aws_key_pair.key.key_name
  
  tags = {
    Name = "application"
  }
  provisioner "local-exec" {
    command = "echo The server's IP address is ${self.private_ip}"
 }
}
