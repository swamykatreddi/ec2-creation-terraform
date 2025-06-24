resource "random_password" "password" {
  count            = 2
  length           = 16
  special          = true
  upper            = true
  lower            = true
  min_numeric      = 4
  min_special      = 4
  min_upper        = 4
  min_lower        = 4
  override_special = "!@#$"
}

#resource "aws_secretsmanager_secret" "password" {
# count       = 2
#name        = "password-${count.index + 1}"
#description = "This is a password ${count.index + 1}"
#tags = {
#Name        = "password-${count.index + 1}"
#Environment = var.environment
#}
#}

#resource "aws_secretsmanager_secret_version" "password_version" {
#count         = 2
#secret_id     = aws_secretsmanager_secret.password[count.index].id
#secret_string = random_password.password[count.index].result
#}
