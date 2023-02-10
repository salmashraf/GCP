variable "region" {
type = string 
}
variable "vpc_name" {
type = string 
}
variable "subnet_name" {
type = map  
}

variable "vpc_cidr" {
type = string  
}

variable "router-name" {
  type        = string
}

variable "nat-name" {
  type        = string
}

variable "routing-mode" {
  type        = string
}

variable "auto-subnets" {
  type        = bool
}


