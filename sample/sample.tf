data "aws_security_group" "workstation" {
  name = "allow all"
}

output "security_groups" {
  value = data.aws_security_group.workstation
}