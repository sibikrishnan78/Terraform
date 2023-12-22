data "aws_security_group" "default" {
  name = "allow all"
}

output "security_groups" {
  value = data.aws_security_group.default
}