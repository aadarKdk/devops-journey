vagrant@vagrant:~/03-minimal-module$ cp ../02-launch-aws-instance/main.tf .

vagrant@vagrant:~/03-minimal-module$ ls
main.tf

vagrant@vagrant:~/03-minimal-module$ cat main.tf 
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
    CreatedBy = "Terraform in Aug"
  }
}

vagrant@vagrant:~/03-minimal-module$ vim main.tf 

vagrant@vagrant:~/03-minimal-module$ vim providers.tf 

vagrant@vagrant:~/03-minimal-module$ ls
main.tf  providers.tf

vagrant@vagrant:~/03-minimal-module$ vim variables.tf

vagrant@vagrant:~/03-minimal-module$ cat main.tf 

resource "aws_instance" "demo_server" {
  ami                    = "ami-0360c520857e3138f"
  instance_type          = "t2.nano"
  key_name               = "demo-aadarsha-key-pair"
  vpc_security_group_ids = ["sg-048bcbb20a70002e1"]
  tags = {
    Name      = "demo-vm-aadarsha",
    CreatedBy = "Terraform in Aug"
  }
}

vagrant@vagrant:~/03-minimal-module$ vim variables.tf 

vagrant@vagrant:~/03-minimal-module$ vim main.tf 

vagrant@vagrant:~/03-minimal-module$ terraform init

vagrant@vagrant:~/03-minimal-module$ terraform validate
Success! The configuration is valid.

vagrant@vagrant:~/03-minimal-module$ terraform apply

vagrant@vagrant:~/03-minimal-module$ ls
main.tf  providers.tf  terraform.tfstate  variables.tf

vagrant@vagrant:~/03-minimal-module$ cat terraform.tfstate

vagrant@vagrant:~/03-minimal-module$ ls -la
-rw-rw-r-- 1 vagrant vagrant  336 Aug 29 11:48 main.tf
-rw-rw-r-- 1 vagrant vagrant   43 Aug 29 11:17 providers.tf
drwxr-xr-x 3 vagrant vagrant 4096 Aug 29 11:54 .terraform
-rw-r--r-- 1 vagrant vagrant 1377 Aug 29 11:55 .terraform.lock.hcl
-rw-rw-r-- 1 vagrant vagrant 5254 Aug 29 12:05 terraform.tfstate
-rw-rw-r-- 1 vagrant vagrant  765 Aug 29 11:53 variables.tf

vagrant@vagrant:~/03-minimal-module$ terraform validate
Success! The configuration is valid.

vagrant@vagrant:~/03-minimal-module$ terraform apply

vagrant@vagrant:~/03-minimal-module$ ls
main.tf  providers.tf  terraform.tfstate  terraform.tfstate.backup  variables.tf

vagrant@vagrant:~/03-minimal-module$ cat terraform.tfstate

vagrant@vagrant:~/03-minimal-module$ terraform refresh

vagrant@vagrant:~/03-minimal-module$ ls
main.tf  providers.tf  terraform.tfstate  terraform.tfstate.backup  variables.tf

vagrant@vagrant:~/03-minimal-module$ cat terraform.tfstate.backup 

vagrant@vagrant:~/03-minimal-module$ terraform destroy --auto-approve

vagrant@vagrant:~/03-minimal-module$ cat terraform.tfstate

vagrant@vagrant:~/03-minimal-module$ cat terraform.tfstate.backup

