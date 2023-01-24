resource "aws_iam_user" "tst" {
  name          = var.user_name
  path          = "/"
  force_destroy = true

}

resource "aws_iam_user_login_profile" "tst" {
  user = aws_iam_user.tst.name
  // pgp_key = "keybase:test_cloud"

  // Para permitir o reste de senha, a opção change password deve estar 
  // habilitada no iam em settings account.
  password_reset_required = true
}

// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment  


resource "aws_iam_role" "role" {
  name = "test-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

// resource "aws_iam_group" "group" {
//   name = "test-group"
// }

resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"

// Policy para Adminstrator Access
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
}
EOF
}


resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment"
  users      = [aws_iam_user.tst.name]
  roles      = [aws_iam_role.role.name]
  // groups     = [aws_iam_group.group.name]
  policy_arn = aws_iam_policy.policy.arn
}