resource "aws_instance" "demo_server" {
  ami                    = var.AMI
  instance_type          = var.INSTANCE_TYPE
  availability_zone    = var.ZONE
  key_name               = "demo-aadarsha-key-pair"
  vpc_security_group_ids = var.SECURITY_GROUP
  tags = {
    Name      = "demo-vm-aadarshakdk"
    CreatedBy = "Terraform"
  }
}

