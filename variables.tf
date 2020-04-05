variable "instance_count" {
  default = 1
}

variable "key_name" {
  description = "Private key name to use with instance"
  default     = "ktbcs-key"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t3.small"
}

variable "ami" {
  description = "Base AMI to launch the instances"

  # Ubuntu 18.x AMI
  default = "ami-067707eefb70fdd6f"
}

variable "subnet_id" {
  description = "Default vpc subnet"
  default = "subnet-e33cdb85"
}


