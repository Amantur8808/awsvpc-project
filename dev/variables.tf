variable "key_name" {
  type    = string
  default = "test"
}

variable "presentation_private_ip" {
  type    = string
  default = "10.0.10.88"
}

variable "application_private_ip" {
  type    = string
  default = "10.0.11.65"
}

variable "database_private_ip" {
  type    = string
  default = "10.0.12.8"
}

variable "presentation_subnet" {
  type    = string
  default = "10.0.10.0/24"
}

variable "application_subnet" {
  type    = string
  default = "10.0.11.0/24"
}

variable "database_subnet" {
  type    = string
  default = "10.0.12.0/24"
}

variable "presentation_zone" {
  type    = string
  default = "us-east-2a"
}

variable "application_zone" {
  type    = string
  default = "us-east-2b"
}

variable "database_zone" {
  type    = string
  default = "us-east-2c"
}

variable "ingress_rule" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "egress_rule" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "application_ingress" {
  type    = string
  default = "10.0.10.0/24"
}

variable "application_ingress_rule" {
  type    = string
  default = "10.0.12.0/24"
}

variable "application_egress" {
  type    = string
  default = "10.0.10.0/24"
}

variable "application_egress_rule" {
  type    = string
  default = "10.0.12.0/24"
}

variable "database_ingress" {
  type    = string
  default = "10.0.11.0/24"
}

variable "database_egress" {
  type    = string
  default = "10.0.11.0/24"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}

variable "environment" {
  type    = string
  default = "dev"
}

variable "aws_region" {
  type    = string
  default = "us-east-2"
}

