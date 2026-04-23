variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "app_port" {
  type    = number
  default = 8080
}

variable "application_ingress_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
