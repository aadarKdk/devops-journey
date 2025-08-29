provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo_server" {
  ami                    = "ami-0360c520857e3138f"
  instance_type          = "t2.nano"
  key_name               = "demo-aadarsha-key-pair"
  vpc_security_group_ids = ["sg-048bcbb20a70002e1"]
  tags = {
    Name      = "demo-vm-aadarsha",
    CreatedBy = "Terraform"
  }
}

