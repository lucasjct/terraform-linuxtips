variable "aws_ami_ubuntu" {

  type        = list(string)
  default     = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  description = "official image ubuntu from canonical"

}

variable "environment" {

  type        = string
  default     = "production"
  description = "environment for tests"

}

variable "plus" {

  default     = 2
  description = "add more servers"

}


variable "production" {

  default     = false
  description = "value for variable true for production"

}