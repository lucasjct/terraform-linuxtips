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
    "Name" = "dependecy"
  }

}


// dependência implícita
resource "aws_eip" "ip_elastic" {

  vpc      = true
  instance = aws_instance.instance_web.id
}

resource "aws_instance" "instance_web2" {

  ami           = data.aws_ami.server-ubuntu.id
  instance_type = "t2.micro"
  tags = {
    "Name" = "dependecy"
  }
 // dependência explicita
  depends_on = [aws_instance.instance_web]

}