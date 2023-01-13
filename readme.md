docker run -it -v /c/Users/AS/workspace/terraform-linuxtips:/app -w /app --entrypoint  hashicorp/terraform:light sh

## Day - 1

Inicialiar projeto terraform e gerar o `terraform.tfstate`
* `terraform init` 

Obter ajuda
 * `terraform -h`  

Instala os plugins disponíveis no terraform
* `terraform init -upgrade`

Utiliza o arquivo state em memória 
* `terraform plan -out <nome-arquivo>` 

Aplicar o plano 

* `terraform apply <nome-arquivo>`   

Liberar o console Terraform  para interagir com as expressões do terraform
* `terraform console`


### Documentação

* Providers que se integram com terrraform:   
https://registry.terraform.io/browse/providers   

* Documentação sobre a sintaxe da linguagem HCL  
https://developer.hashicorp.com/terraform/language/providers/requirements

* Documentação de como aplicar os recursos do provider:    
https://registry.terraform.io/providers/hashicorp/aws/latest/docs    


* Definições de variáveis no Terrform  
https://developer.hashicorp.com/terraform/language/values  


### Como funcionam as chamadas para API da AWS com Terraform   


![img](./img/call-for-api-aws.png)   

### Como se comunica o binário do Terraform com o cloud provider  
![img](./img/comunicacao-binario-provider.png)

## Day - 2  

* Modules Terraform  
https://developer.hashicorp.com/terraform/language/modules/develop   

Quando trabalhamos com módulos, cada diretório será um módulo. É importante sempre manter o arquivo `main.tf` (que contém os blocos __terraform__ e __backend__) dentro da raiz (fora de módulos) para não termos problemas, ele é o root module. O módulo é como se fosse um classe, ele encapsula os demais recursos.    

Exemplo do bloco module:   

```ruby
module "server" {

  source  = "./server" // nome do modulo
  servers = 1 // input que o root module impõe ao child module server

}
```

Para obter o output dos recursos criados, devo chamar o bloco de output dentro do arquivo root module (`main.tf`). Para isso, após criar o arquivo de __output__ no módulo filho, preciso evocá-lo no módulo raiz com a seguinte sintaxe:   

```ruby
output "ip_address" {
    
// module + nome do módulo + nome do output criado.

    value = module.server.ip_address
}
```

* Backend  

O Backend define o local em que o Terraform armazenará os dados do arquivo __state__.

https://developer.hashicorp.com/terraform/language/settings/backends/configuration  

O bloco do backend fica dentro do bloco do Terraform e normalmente eles são definidos no arquivo main.tf. Exemplo de backend utilizando o S3 da AWS:

```ruby
  backend "s3" {

    bucket = "aws-linux-tips"
    key    = "terraform-test.tfstate"
    region = "us-east-1"

  }
```   

* Comando para baixar as informações do backend (que neste projeto está no S3) dentro de um arquivo:  
`terraform state pull >> aula-backend.tfstate`    

* Comando para caso queira subir as alterações no `.tfstate`   
`terraform state push aula-backend.tfstate`  