provider "aws" {

  region = "us-east-1"

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

    bucket = "aws-linux-tips"
    key    = "terraform-test.tfstate"
    region = "us-east-1"

  }

}