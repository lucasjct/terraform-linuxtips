resource "aws_s3_object" "object" {

    bucket = "s3://linux-estudos-lucas/teste-terraform/"
    key = "file.csv"
    source = "./file.csv"
}

