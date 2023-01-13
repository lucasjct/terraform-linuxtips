resource "aws_vpc" "vpc" {

  cidr_block = "172.16.0.0/16"
  tags = {
    "Name" = "my_vpc"
  }

}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "172.16.0.0/24"
  tags = {
    "Name" = "tf_vpc_id"
  }
}


resource "aws_vpc" "vpc-west" {
  provider   = aws.west
  cidr_block = "172.16.0.0/16"
  tags = {
    "Name" = "my_vpc"
  }

}

resource "aws_subnet" "subnet-west" {
  provider   = aws.west
  vpc_id     = aws_vpc.vpc-west.id
  cidr_block = "172.16.0.0/24"
  tags = {
    "Name" = "tf_vpc_id"
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = var.ami_ubuntu

  }

  owners = var.owner_ami_ubuntu # ubuntu

}

# Obter AMI do ubuntu da região us-west-1, cada região a AMI possui um id distinto
data "aws_ami" "west-ubuntu" {
  provider    = aws.west
  most_recent = true
  filter {
    name   = "name"
    values = var.ami_ubuntu

  }

  owners = var.owner_ami_ubuntu # ubuntu

}

resource "aws_instance" "web" {

  # exemplo de como se trabalhar com referência 1  
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.ec2_instance

  #exemplo de como se trabalhar com referência 2
  subnet_id = aws_subnet.subnet.id

  tags = {
    Name = "Instance east"
  }
}

resource "aws_instance" "web-west" {

  # expressão com referência ao alias (main.tf) que possibilita criar a instância em outra região.
  provider = aws.west
  # exemplo de como se trabalhar com referência 1  
  ami           = data.aws_ami.west-ubuntu.id
  instance_type = var.ec2_instance

  #exemplo de como se trabalhar com referência 2
  subnet_id = aws_subnet.subnet-west.id

  tags = {
    Name = "Instance west"
  }
}