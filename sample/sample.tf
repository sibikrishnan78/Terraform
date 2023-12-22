data "aws_security_group" "workstation" {
  name = "allow all"
}

output "security_groups_id" {
  value = data.aws_security_group.workstation
}