# AMI to be used to launch the host
variable "ami" {
  type        = "string"
  description = "AMI to be used when launching the SonarQube instances"
  default     = "ami-ae7bfdb8"
}

variable "instance_type" {
  type        = "string"
  description = "Type of the EC2 instance to be launched"
  default     = "t2.xlarge"
}

variable "private_subnet_id" {
  type        = "string"
  description = "Subnet in which the EC2 instance should be launched"
}

variable "security_group_ids" {
  type        = "list"
  description = "Security groups to be attached to the instance"
}

variable "key_name" {
  type        = "string"
  description = "Key pair that needs to be attached to the instance"
  default     = "magellan"
}

variable "chef_server_url" {
  description = "Chef server url from where the chef client fetches the artifacts"
}

variable "chef_run_list" {
  type = "list"
}
