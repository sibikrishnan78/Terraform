data "aws_ami" "centos" {
  most_recent = true
  owners      = ["973714476881"]
  name_regex = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "all-security" {
  name = "all-security"
}
