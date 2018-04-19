# Create a new load balancer
resource "aws_elb" "lb_configuration" {
  name            = "sonarqube-elb"
  internal        = true
  subnets         = ["${var.sonarqube_elb_subnets}"]
  security_groups = ["${var.sonarqube_elb_sg}"]

  listener {
    instance_port     = 9000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:9000"
    interval            = 30
  }

  instances                   = ["${var.sonarqube_elb_instances}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "sonarqube-elb"
  }
}

output "sonarqube_elb_dns" {
  value = "${aws_elb.lb_configuration.dns_name}"
}

output "sonarqube_elb_zoneid" {
  value = "${aws_elb.lb_configuration.zone_id}"
}
