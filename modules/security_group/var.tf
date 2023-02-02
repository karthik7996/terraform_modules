variable "input_type" {
  type        = string
  default     = "ingress"
}

variable "output_type" {
  type        = string
  default     = "egress"
}

variable "cidr" {
  type        = string
  default     = "0.0.0.0/0"
}

variable "prototype" {
  type        = string
  default     = "-1"
}

variable "prototype1" {
  type        = string
  default     = "-1"
}

variable "vpc_id" {
  description = "specify id of the vpc"
  type        = string
}

variable "region" {
  type        = string
  default     = "us-east-1"
}

