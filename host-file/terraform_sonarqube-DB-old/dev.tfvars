
# AWS Region in which the infrastructure should be provisioned
aws_region = "us-east-1"

# VPC in which the Sonarqube should be deployed
vpc_id = "vpc-e8f02a8e"

# Security Subnet CIDR for inbound traffic
security_subnet_cidr = "10.0.0.0/16","10.100.0.0/16"

# Subnet in which Sonarqube should be launched (Private subnet should be used)
private_subnet_id = ""

# Route53 record name for Sonarqube
sonarqube_route53_record_name = "sonarqube-dev.magellancloud.com"

# Hosted Zone ID in which the route53 entry should be created
dns_hosted_zone_id = "ZZFUBY9TCMW6"

# Chef server url from where the chef client fetches the artifacts
chef_server_url = "https://prod-chef-esgelcsrwlcxujxx.us-east-1.opsworks-cm.io/organizations/default"