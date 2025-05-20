resource "aws_key_pair" "key" {
  key_name   = "sshkey"
  public_key = file("/home/tokashawky/.ssh/id_rsa.pub")
}
