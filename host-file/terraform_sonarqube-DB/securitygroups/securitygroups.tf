resource "aws_security_group" "SonarSecurity" {
  name        = "SonarSecurity"
  description = "SonarQube terraform generated security group"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = "${var.security_subnet_cidr}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = "${var.vpc_id}"

  tags {
    Name = "SonarSecurity"
  }
}

output "SonarSecurity_id" {
  value = "${aws_security_group.SonarSecurity.id}"
}
