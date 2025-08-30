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
  type        = string
  default     = "t2.nano"
}

variable "SECURITY_GROUP" {
  description = "List of Security Group IDs to associate with the instance."
  type        = list(string)
  default     = ["sg-048bcbb20a70002e1"]
}

variable "AMI" {
  description = "The Amazon Machine Image (AMI) ID to use for launching the instance."
  type        = string
  default     = "ami-0360c520857e3138f"
}

