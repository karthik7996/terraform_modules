variable "instance_name" {
  type    = string
  default = "Sharath-ec2"
}

variable "source" {
  type    = string
  default = "/home/ec2-user/terraform/flask/project"
}

variable "destination" {
  type    = string
  default = "/home/ec2-user/"
}


variable "type" {
  type    = string
  default = "ssh"
}

variable "user" {
  type    = string
  default = "ec2-user"
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "key_pair" {
  type    = string
  default = "/home/ec2-user/terraform/flask/Sharath.pem"
}

