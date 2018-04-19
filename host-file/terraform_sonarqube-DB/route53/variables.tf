variable "hosted_zone_id" {
  type        = "string"
  description = "Hosted zone ID of the domain"
  default     = "ZZFUBY9TCMW6"
}

# Name of the record to be created
variable record_name {}

# Value(IP address) of the record
variable record_value {}

# Value(ELB names) of the record
variable elb_dns_name {}

# ELB DNS Zone ID
variable elb_zone_id {}
