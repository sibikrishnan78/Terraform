terraform {
  backend "s3" {
    bucket = "terraform-78"
    key    = "Terraform/dev/terraform.tfstate"
    region = "us-east-1"
  }
}
