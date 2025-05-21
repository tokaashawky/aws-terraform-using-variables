vpc_cidr = "10.10.0.0/16"
# PublicSubnet1_cidr = "10.10.1.0/24"
# PublicSubnet2_cidr = "10.10.2.0/24"
# privateSubnet1_cidr = "10.10.3.0/24"
# privateSubnet2_cidr = "10.10.4.0/24"
region = "us-east-1"
# ami = "ami-0e58b56aa4d64231b" 
instance_type = "t2.micro"
subnets = [
{
    cidr_block = "10.10.1.0/24"
    availability_zone = "us-east-1a"
    name = "PublicSubnet1"
    type = "public"  
},
{
    cidr_block = "10.10.2.0/24"
    availability_zone = "us-east-1b"
    name = "PublicSubnet2"
    type = "public"  
},
{
    cidr_block = "10.10.3.0/24"
    availability_zone = "us-east-1a"
    name = "PrivateSubnet1"
    type = "private"  
},
{
    cidr_block = "10.10.4.0/24"
    availability_zone = "us-east-1b"
    name = "PrivateSubnet2"
    type = "private"   
}
]
db_username = "toka"
db_password = "Zayton_812"
db_instance_class = "db.t3.micro" 
db_S_class = "gp2" 
