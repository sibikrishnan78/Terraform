resource "aws_instance" "instance" {
  for_each = var.component
  ami           = data.aws_ami.centos.id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.all-security.id ]

  tags = {
    Name = each.value["name"]
  }
}

resource "null_resource" "provisioner" {

  depends_on = [aws_instance.instance, aws_route53_record.records]
  for_each = var.component
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance[each.value["name"]].private_ip
    }

    inline = [
      "rm -rf Roboshop",
      "git clone https://github.com/sibikrishnan78/Roboshop.git",
      "cd Roboshop/",
      "sudo bash ${each.value["name"]}.sh ${lookup(each.value,"password", "null")}"
    ]
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

