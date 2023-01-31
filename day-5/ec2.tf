data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = var.aws_ami_ubuntu
  }


  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web_server" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

// bloco dinamico serve para criarmos recursos aninhados
// no exemplo abaixo, temos alguns volumes EBS que serão anexados
// a máquina EC2. Para especificá-los usamos o arquivo terraform.tfvars 
// e especificamos o tipo da variável no variables.tf

  dynamic "ebs_block_device" {
    for_each = var.blocks

    content {
      volume_type = ebs_block_device.value["volume_type"]
      volume_size = ebs_block_device.value["volume_size"]
      device_name = ebs_block_device.value["device_name"]
    }

  }

}