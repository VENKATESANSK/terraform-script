# Terraform version
terraform {
  required_version = "> 0.8.0"
}

# Provider and access details
provider "aws" {
 
  region     = "${var.aws_region}"
}

module "sonarqube_security_groups" {
  source               = "./securitygroups"
  vpc_id               = "${var.vpc_id}"
  security_subnet_cidr = ["${var.security_subnet_cidr}"]
}

# Create Sonarqube
module "sonarqube" {
  source             = "./instances"
  private_subnet_id  = "${var.private_subnet_id}"
  security_group_ids = ["${module.sonarqube_security_groups.SonarSecurity_id}"]
  chef_server_url    = "${var.chef_server_url}"
  chef_run_list      = ["role[sonarqube]"]
}

module "lb_configuration" {
  source                  = "./loadbalancer"
  sonarqube_elb_instances = "${module.sonarqube.instance_id}"
  sonarqube_elb_subnets   = "${var.private_subnet_id}"
  sonarqube_elb_sg        = ["${module.sonarqube_security_groups.SonarSecurity_id}"]
}

# Route53 entry 
module "sonarqube_route" {
  source       = "./route53"
  record_value = "${module.sonarqube.private_ip}"
  record_name  = "${var.sonarqube_route53_record_name}"
  elb_dns_name = "${module.lb_configuration.sonarqube_elb_dns}"
  elb_zone_id  = "${module.lb_configuration.sonarqube_elb_zoneid}"
}