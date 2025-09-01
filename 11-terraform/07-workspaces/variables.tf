variable "REGION" {
  description = "AWS region where resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "ZONE" {
  description = "Availability Zone within the region where resources will be deployed."
  type        = string
  default     = "us-east-1a"
}

variable "INSTANCE_TYPE" {
  description = "The EC2 instance type."
  type        = map(any)
  default = {
    dev  = "t2.micro"
    stag = "t2.nano"
    prod = "t2.small"
  }
}

variable "SECURITY_GROUP" {
  description = "List of Security Group IDs to associate with the instance."
  type        = list(string)
  default     = ["sg-048bcbb20a70002e1"]
}

variable "AMI" {
  description = "The Amazon Machine Image (AMI) ID to use for launching the instance."
  default = {
    us-east-1 = "ami-0360c520857e3138f"
    us-east-2 = "ami-0cfde0ea8edd312d4"
  }
  type = map(any)
}

