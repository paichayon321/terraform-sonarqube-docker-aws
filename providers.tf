terraform {
  backend "s3" {
    bucket = "terraform-bucket-poc-3436"
    key    = "terraform.selenium-tfstate"
    region = "ap-southeast-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "${var.AWS_REGION}"
}
