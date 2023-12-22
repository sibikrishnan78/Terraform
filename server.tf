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

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "frontend.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}

resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "mongodb.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongodb.private_ip]
}

resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "catalogue.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}

resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "redis.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}

resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [  data.aws_security_group.all-security.id ]

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "user.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [  data.aws_security_group.all-security.id ]

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "cart.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "mysql.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "shipping.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "rabbitmq.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}

resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "payment.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}

resource "aws_instance" "dispatch" {
  ami           = data.aws_ami.centos.id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = "dispatch1"
  }
}

resource "aws_route53_record" "dispatch" {
  zone_id = "Z08619273P4WVGQRW042K"
  name    = "dispatch.deveng23.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.dispatch.private_ip]
}