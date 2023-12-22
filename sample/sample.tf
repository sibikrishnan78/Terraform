data "aws_security_group" "selected" {
  name = "allow all"
}

output "security_groups_id" {
  value = data.aws_security_group.selected
}