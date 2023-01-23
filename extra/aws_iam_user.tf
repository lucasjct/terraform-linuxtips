resource "aws_iam_user" "tst" {
  name          = "<name-user>"
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