
variable "aws_region" {}

variable "vpc_id" {}

variable "security_subnet_cidr" {
  type = "list"
}

variable "private_subnet_id" {}

variable "chef_server_url" {}

variable "dns_hosted_zone_id" {}

variable "sonarqube_route53_record_name" {}