terraform {
  backend "s3" {
    bucket = "demo-aadarsha-bucket"
    key    = "terraform-backend"
    region = "us-east-1"
  }
}

