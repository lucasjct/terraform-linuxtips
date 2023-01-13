variable "ami_ubuntu" {
  type        = list(string)
  default     = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  description = "set value for ami ubuntu"

}

variable "owner_ami_ubuntu" {

    type = list(string)
    default = ["099720109477"]
    description = "Official owner's id from Ubuntu - Canonical"
  
}


variable "ec2_instance" {

  type        = string
  default     = "t2.micro"
  description = "set value for instance"
 // validação para garantir que a instância aplicada seja um micro
  validation {
    condition     = length(var.ec2_instance) > 4 && substr(var.ec2_instance, 3, 7 ) == "micro"
    error_message = "the value for ec2 should be t2.micro"
  }

}