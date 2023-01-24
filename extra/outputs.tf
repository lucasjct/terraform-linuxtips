output "password" {

  description = "Password for user:"
  value = aws_iam_user_login_profile.tst.encrypted_password

}

output "arn" {

  description = "ARN value. Get you id account of 12 numbers:"
  value = aws_iam_user.tst.arn
}

output "senha" {

  description = "Copy e save youd password:"
  value = aws_iam_user_login_profile.tst.password
}

output "id" {

  description = "Get you alias accoun:"
  value = aws_iam_user_login_profile.tst.id

}

output "name" {
  
  description = "Get you user name:"
  value = aws_iam_user_login_profile.tst.user

}