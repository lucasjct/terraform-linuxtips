terraform {

  required_version = "v1.3.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.49.0"
    }
  }

  # O backend é para guardar o tfstates no S3 e não deixá-lo exposto por questão de segurança.

  backend "s3" {

    bucket = "aws-linux-tips"
    key    = "terraform-test.tfstate"
    region = "us-east-1"

  }
}