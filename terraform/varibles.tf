variable "ami" {
  type    = string
  default = "ami-06dc09bb8854cbde3"
}
variable "region" {
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  type        = string
  default     = "172.16.0.0/16"
}

variable "pub_sub1_cidr_block" {
  type    = string
  default = "172.16.1.0/24"
}

variable "pub_sub2_cidr_block" {
  type    = string
  default = "172.16.2.0/24"
}
variable "prv_sub1_cidr_block" {
  type    = string
  default = "172.16.3.0/24"
}
variable "prv_sub2_cidr_block" {
  type    = string
  default = "172.16.4.0/24"
}

