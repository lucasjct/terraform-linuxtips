provider "aws" {

  # region = "us-east-1"

  # Abaixo a interpolação que permite executar workspace em regiões distintas
  region = terraform.workspace == "production" ? "us-east-1" : "us-east-2"

}

terraform {

  required_version = "v1.3.3"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"

    }

  }

  backend "s3" {

    // nome da tabela que pode ser visto no arquivo dynamodb.tf

    # dynamodb_table = "terraform-state-lock-dynamo"
    bucket = "aws-linux-tips"
    key    = "terraform-test.tfstate"
    region = "us-east-1"

    // criptografia do lado do servidor
    encrypt = true

  }

}