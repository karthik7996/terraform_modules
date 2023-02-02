resource "aws_instance" "ec2_public" {
  ami                         = var.ami
  associate_public_ip_address = var.value
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = data.aws_subnet.selected_subnet.id
  vpc_security_group_ids      = [data.aws_security_group.selected_security_group.id]

  tags = {
    Name = var.instance_name
  }
}

data "aws_subnet" "selected_subnet" {
  id = var.subnet_id
}

data "aws_security_group" "selected_security_group" {
  id = var.vpc_security_group_id
}
