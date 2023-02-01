// exemplo de depedência implícita e explícita


data "aws_ami" "server-ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"] # ubuntu

}

resource "aws_instance" "instance_web" {

  ami           = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  tags = {

    // exemplo de interpolação de strings
    // "Name" = "hello ${var.name}" 

    // Exemplo de interpolação com condicional

    "Name" = "Hello %{if var.name == "Testando interpolção"}${var.name}%{else}Var name diferente do esperado%{endif}!"

  }

}
