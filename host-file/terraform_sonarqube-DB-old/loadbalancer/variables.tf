variable "sonarqube_elb_sg" {
  type = "list"
}

variable "sonarqube_elb_subnets" {
  type        = "string"
  description = "Subnets to be attached to the ELB"
}

variable "sonarqube_elb_instances" {
  type        = "string"
  description = "Instances to be attached to the ELB"
}
