resource "aws_instance" "demo_server" {
  ami                    = var.AMI[var.REGION]
  instance_type          = lookup(var.INSTANCE_TYPE, terraform.workspace, "t2.micro")
  availability_zone      = var.ZONE
  key_name               = "demo-aadarsha-key-pair"
  vpc_security_group_ids = var.SECURITY_GROUP
  tags = {
    Name      = "${terraform.workspace}-demo-vm-aadarsha",
    CreatedBy = "Terraform"
  }
}

output "instance_id" {
  value = aws_instance.demo_server.id
}

output "instance_name" {
  value = terraform.workspace
}

