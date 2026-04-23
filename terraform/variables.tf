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

variable "app_image_repository" {
  type    = string
  default = "avi44/aravinth_apps:tagname"
}

variable "app_image_tag" {
  type    = string
  default = "latest"
}

variable "database_engine" {
  type    = string
  default = "postgres"
}

variable "db_name" {
  type    = string
  default = "appdb"
}

variable "db_user" {
  type    = string
  default = "appuser"
}

variable "db_password" {
  type      = string
  default   = "change-me"
  sensitive = true
}
