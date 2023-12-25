data "aws_ami" "centos" {
  most_recent = true
  owners      = ["973714476881"]
  name_regex = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "all-security" {
  name = "all-security"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "component" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t3.small"
    }
    mongodb = {
      name = "mongodb"
      instance_type = "t3.small"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.small"
    }
    redis = {
      name = "redis"
      instance_type = "t3.small"
    }
    user = {
      name = "user"
      instance_type = "t3.small"
    }
    cart = {
      name = "cart"
      instance_type = "t3.small"
    }
    mysql = {
      name = "mysql"
      instance_type = "t3.small"
    }
    shipping = {
      name = "shipping"
      instance_type = "t3.small"
    }
    rabbitmq = {
      name = "rabbitmq"
      instance_type = "t3.small"
    }
    payment = {
      name = "payment"
      instance_type = "t3.small"
    }
    dispatch = {
      name = "dispatch"
      instance_type = "t3.small"
    }

  }
}

resource "aws_instance" "instance" {
  for_each = var.component
  ami           = data.aws_ami.centos.id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = each.value["name"]
  }
}

resource "aws_route53_record" "records" {
  for_each = var.component
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "${each.value["name"]}.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}

