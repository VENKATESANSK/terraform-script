variable "vpc_id" {
  type        = "string"
  description = "VPC for security group"
}

variable "security_subnet_cidr" {
  type        = "list"
  description = "Subnet CIDR from which the traffic should be allowed"
}
