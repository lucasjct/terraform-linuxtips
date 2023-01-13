resource "aws_vpc" "vpc-server" {
  cidr_block = "172.16.0.0/16"
  tags = {
    "Name" = "my_vpc"
  }

}

resource "aws_subnet" "subnet-server" {
  vpc_id     = aws_vpc.vpc-server.id
  cidr_block = "172.16.0.0/24"
  tags = {
    "Name" = "tf_vpc_id"
  }
}


data "aws_ami" "server-ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = var.ami_ubuntu
  }

  owners = var.owner_ami_ubuntu # ubuntu

}


resource "aws_instance" "server" {

  count = var.servers // recebera o valor atribuído no module
  ami           = data.aws_ami.server-ubuntu.id
  instance_type = var.ec2_instance
  subnet_id = aws_subnet.subnet-server.id
  tags = {
    Name = "name"
  }
}