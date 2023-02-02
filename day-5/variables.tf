variable "aws_ami_ubuntu" {

  type        = list(string)
  default  = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  description = "official image ubuntu from canonical"

}

variable "blocks" {

  type = list(object({
    volume_type : string,
    volume_size = string,
    device_name = string
  }))

  description = "volumns config for EBS"
}