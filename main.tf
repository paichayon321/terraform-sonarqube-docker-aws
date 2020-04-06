terraform {
  backend "s3" {
    bucket = "terraform-bucket-poc-3436"
    key    = "terraform.sonarqube-tfstate"
    region = "ap-southeast-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "ap-southeast-1"
}

# Create EC2 instance
resource "aws_instance" "default" {
  ami                    = var.ami
  count                  = var.instance_count
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.default.id]
  source_dest_check      = false
  user_data = "${file("run-sonarqube.sh")}"
  instance_type          = var.instance_type

  tags = {
    Name = "SonarQube-Terraform"
  }
}

resource "aws_security_group" "default" {
  name = "sonarqube-terraform-sg"
  ingress {
    protocol  = "TCP"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
