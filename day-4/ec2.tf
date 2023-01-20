data "aws_ami" "server-ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = var.aws_ami_ubuntu
  }

  owners = ["099720109477"] # ubuntu

}

resource "aws_instance" "instance_web" {

  # exemplo de condicional com Terraform  
  // count = var.environment == "production" ? 2 : 1
  // count = var.environment == "production" ? 2 + var.plus : 1
  // count = var.production ? 2 : 1  // outra forma de expressar a primeira condição
  count         = !var.production ? 2 : 1 // aqui pergunta se o valor de production e diferente de true, como é, subirá 2 instâncias
  ami           = data.aws_ami.server-ubuntu.id
  instance_type = count.index > 1 ? "t2.micro" : "t3.medium"
  tags = {
    "Name" = "dependecy"
  }

}