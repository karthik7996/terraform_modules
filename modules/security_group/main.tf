provider "aws" {
  region = var.region
}
resource "aws_security_group" "vpc_security_group" {
  name   = "sharath_security_group"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "allow_ssh" {
  type              = var.input_type
  from_port         = 0
  to_port           = 0
  protocol          = var.prototype
  cidr_blocks       = [var.cidr]
  security_group_id = aws_security_group.vpc_security_group.id
}

resource "aws_security_group_rule" "allow_http_outbound" {
  type              = var.output_type
  from_port         = 0
  to_port           = 0
  protocol          = var.prototype1
  cidr_blocks       = [var.cidr]
  security_group_id = aws_security_group.vpc_security_group.id
}


