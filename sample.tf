data "aws_ami" "centos" {
  most_recent = true
  owners      = ["973714476881"]
  name_regex = "Centos-8-DevOps-Practice"
}

output "centos_ami_id" {
  value = data.aws_ami.centos
}