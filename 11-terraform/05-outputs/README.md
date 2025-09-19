To display the outputs on the terminal:

For the example done on [04-provisioners](https://github.com/erkdk/devops-journey/tree/main/11-terraform/04-provisioners)

To view the outputs of following:
  + My_instance_Lifecycle      = (known after apply)
  + My_instance_Security_group = (known after apply)
  + My_instance_Subnet_ID      = (known after apply)
  + My_instance_private_IP     = (known after apply)
  + My_instance_public_IP      = (known after apply)
  + My_instance_public_URL     = (known after apply)
  + My_instance_state          = (known after apply)


Previous file [main.tf](https://github.com/erkdk/devops-journey/blob/main/11-terraform/04-provisioners/main.tf) is modified to Current file [main.tf](https://github.com/erkdk/devops-journey/blob/main/11-terraform/05-outputs/main.tf).



After typing command: 
```
terraform apply
```
We can see the followings at the end:

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

+   My_instance_Lifecycle = ""
+   My_instance_Security_group = toset([
  "demo-sg-aadarsha-khadka",
])
+   My_instance_Subnet_ID = "subnet-029d70ed8f17aa867"
+   My_instance_private_IP = "172.31.17.58"
+   My_instance_public_IP = "34.207.251.164"
+   My_instance_public_URL = "ec2-34-207-251-164.compute-1.amazonaws.com"
+   My_instance_state = "running"

docs: [here](https://developer.hashicorp.com/terraform/language/values/outputs)
