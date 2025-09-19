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

