resource "aws_instance" "sonar_host" {
  # Get the AMI based on the type of node (master or slave)
  ami = "${var.ami}"

  # Type of the instance to be created
  instance_type = "${var.instance_type}"

  # Subnet in which the instance need to be launched
  subnet_id = "${var.private_subnet_id}"

  #Block devices to be attached to the instance
  root_block_device {
    volume_type = "gp2"
    volume_size = "60"
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_type = "gp2"
    volume_size = "40"
  }

  # Security groups to be attached to the instance
  # Behaves as CFTs VpcZoneIdentifier
  vpc_security_group_ids = ["${var.security_group_ids}"]

  tags = {
    Name          = "sonarqube"
    Owner         = "APP.PPES.Offshore"
    ShutdownTag   = "Enabled"
    ShutdownOrder = "1"
    WBS           = "asset_offshore"
  }

  # Key Name to be attached to the instance
  key_name = "${var.key_name}"

  provisioner "chef" {
    server_url              = "${var.chef_server_url}"
    user_name               = "pivotal"
    user_key                = "${file("./artifacts/chef_cert.pem")}"
    node_name               = "${aws_instance.sonar_host.id}"
    fetch_chef_certificates = true
    log_to_file             = true
    recreate_client         = true

    run_list = ["${var.chef_run_list}"]

    connection {
      user        = "centos"
      type        = "ssh"
      private_key = "${file("./artifacts/magellan.pem")}"
      agent       = false
    }
  }
}

output "instance_id" {
  value = "${aws_instance.sonar_host.id}"
}

output "private_ip" {
  value = "${aws_instance.sonar_host.private_ip}"
}

# TODO: Sonarqube is not using the RDS created here. Commneting it now, so that it can be implemented later and should be moved to a different RDS module
 resource "aws_db_instance" "default" {
   allocated_storage    = 10
   storage_type         = "gp2"
   engine               = "mysql"
   engine_version       = "5.6.17"
   instance_class       = "db.t2.micro"
   name                 = "sonardb"
   username             = "admin"
   password             = "admin@123"
   db_subnet_group_name = "platformdevstack-devplatformdbsubnetgroup-1pms1w6fzpxk6"
   
 }


# output "private_ip" {
#   value = "${aws_instance.sonar_host.private_ip}"
# }


# output "instance_id" {
#   value = "${aws_instance.sonar_host.id}"
# }

