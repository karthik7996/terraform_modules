variable "instance_tenancy" {
  description = "specify instance tenancy for the vpc"
  type        = string
  default     = "default"
}

variable "vpc_cidr_block" {
  description = "specify cidr block for the vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "specify name for the vpc"
  type        = string
  default     = "Sharath-vpc"
}

variable "subnet_cidr_block" {
  description = "specify cidr block for subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subent_name" {
  description = "specify name of the subnet"
  type        = string
  default     = "Sharath-subnet"
}

variable "cidr" {
  description = "specify cidr block for the vpc"
  type        = string
  default     = "0.0.0.0/0"
}

variable "igw_name" {
  description = "specify name of the ig name"
  type        = string
  default     = "Sharath-igw"
}

variable "rt_name" {
  description = "specify name of the rt name"
  type        = string
  default     = "Sharath-rt"
}

variable "value" {
  description = "specify cidr block for the vpc"
  type        = string
  default     = "true"
}

