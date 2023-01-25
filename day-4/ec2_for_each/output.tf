output "ip_adresss" {

  value = {
    for instance in aws_instance.web :
    instance.id => instance.private_ip
  }

}