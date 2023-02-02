variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "value" {
  type        = string
  default = "true"
}

variable "key_name" {
  type        = string
  default = "Sharath"
}

variable "ami" {
  type        = string
  default = "ami-0e1d30f2c40c4c701"
}

variable "vpc_security_group_id" {
  type = string
}

variable "subnet_id" {
  type        = string
}

variable "instance_name" {
  type        = string
}
