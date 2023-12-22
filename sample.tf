data "aws_security_group" "workstation" {
  name = "all-security"
}

output "security_groups" {
  value = data.aws_security_group.workstation.id
}