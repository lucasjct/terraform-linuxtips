module "server" {

  source  = "./server" // nome do modulo
  servers = 1 // input que o root module impõe ao child module server

}

output "ip_address" {

    value = module.server.ip_address
}
