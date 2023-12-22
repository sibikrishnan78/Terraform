data "aws_security_group" "name" {
  name = "allow all"
}

output "security_groups" {
  value = data.aws_security_group.name
}