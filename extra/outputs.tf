output "password" {
  value = aws_iam_user_login_profile.tst.encrypted_password

}

output "arn" {
  value = aws_iam_user.tst.arn
}

output "senha" {
  value = aws_iam_user_login_profile.tst.password
}

output "id" {

  value = aws_iam_user_login_profile.tst.id

}

output "name" {

  value = aws_iam_user_login_profile.tst.user

}