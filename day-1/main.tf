/*Para acessar a documentação oficial do Terraform, podemos
acessar: https://developer.hashicorp.com/terraform/language/syntax/configuration
*/

provider "aws" {

  region = "us-east-1" # Region: Virginia

}

# Criando um alias para criar o recurso em outra região  

provider "aws" {

  alias  = "west"
  region = "us-west-1" # Region: California

}