resource "aws_instance" "demo_server" {
  ami                    = var.AMI[var.REGION]
  instance_type          = var.INSTANCE_TYPE
  availability_zone      = var.ZONE
  key_name               = "demo-aadarsha-key-pair"
  vpc_security_group_ids = var.SECURITY_GROUP
  tags = {
    Name      = "demo-vm-aadarshakdk"
    CreatedBy = "Terraform"
  }
  provisioner "file" {
    source      = "install-apache2.sh"
    destination = "/tmp/install-apache2.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/install-apache2.sh",
      "sudo /tmp/install-apache2.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("mykey-pair.pem")
    host        = self.public_ip
  }

}

output "My_instance_public_IP" {
 value = aws_instance.demo_server.public_ip
}

output "My_instance_private_IP" {
 value = aws_instance.demo_server.private_ip
}

output "My_instance_public_URL" {
 value = aws_instance.demo_server.public_dns
}

output "My_instance_Security_group" {
 value = aws_instance.demo_server.security_groups
}

output "My_instance_Subnet_ID" {
 value = aws_instance.demo_server.subnet_id
}

output "My_instance_Lifecycle" {
 value = aws_instance.demo_server.instance_lifecycle
}

output "My_instance_state" {
 value = aws_instance.demo_server.instance_state
}

