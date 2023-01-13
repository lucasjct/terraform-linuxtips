resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" { // Para utilizar o State Lock, precisamos criar DynamoDB Table.
                                                                // Após sua criação o nome da tabela será parâmetro do bloco  backend dentro de main.tf
  name           = "terraform-state-lock-dynamo"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

    tags = {
      Name        = "DynamoDB Terraform State Lock Table"
      Environment = "production"

  }
}