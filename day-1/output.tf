output "ip_address" {

  #Exemplo de trabalhar com referência. Neste caso, estou apontando para o recurso.
  value = aws_instance.web.public_ip

}