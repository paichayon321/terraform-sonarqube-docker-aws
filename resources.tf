terraform {
  backend "s3" {
    bucket = "terraform-bucket-poc-3436"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}

# Use AWS Terraform provider
provider "aws" {
  region = "ap-southeast-1"
}

# Create EC2 instance
resource "aws_instance" "default" {
  ami                    = var.ami
  count                  = var.instance_count
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.default.id]
  source_dest_check      = false
  user_data = "${file("run-selenium.sh")}"
  instance_type          = var.instance_type

  tags = {
    Name = "Selenium Grid"
  }
}
