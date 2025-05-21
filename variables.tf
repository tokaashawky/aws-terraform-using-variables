variable vpc_cidr {
  type        = string
  description = "CIDR block of VPC"
}
# variable PublicSubnet1_cidr {
#   type        = string
#   description = "CIDR block of PublicSubnet1"
# }
# variable PublicSubnet2_cidr  {
#   type        = string
#   description = "CIDR block of PublicSubnet2"
# }
# variable privateSubnet1_cidr  {
#   type        = string
#   description = "CIDR block of privateSubnet1"   
# }
# variable privateSubnet2_cidr  {
#   type        = string
#   description = "CIDR block of privateSubnet2"
# }
variable region {
  type        = string
  default     = "us-east-1"
}
# variable ami {
#   type        = string
#   description = "AMI of VMS"
# }
variable instance_type {
  type        = string
  description = "instance_type of VMS"
}
# variable env {
#   type        = string
# }
# variable bastion_count {
#   type        = number
# }

variable subnets {
  type = list(object({
    cidr_block = string
    availability_zone = string
    name = string
    type = string  # public or private
  }))
}