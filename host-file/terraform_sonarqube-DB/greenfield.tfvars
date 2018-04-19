# AWS Acess key
aws_access_key = ""

# AWS Secret Key
aws_secret_key = ""

# AWS Region in which the infrastructure should be provisioned
aws_region = "us-east-1"

# VPC in which the Sonarqube should be deployed
vpc_id = ""

# Security Subnet CIDR for inbound traffic
security_subnet_cidr = ["10.0.0.0/16", "10.100.0.0/16"]

# Subnet in which Sonarqube should be launched (Private subnet should be used)
private_subnet_id = ""

# Route53 record name for Sonarqube
sonarqube_route53_record_name = "sonarqube.magellancloud.com"

# Hosted Zone ID in which the route53 entry should be created
dns_hosted_zone_id = "ZZFUBY9TCMW6"

# Chef server url from where the chef client fetches the artifacts
chef_server_url = ""