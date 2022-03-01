variable "ami" {
  description = "AMI"
  type        = string
  default     = ""
}

variable "instance_type" {
  default = "t2.micro"
}

#===============================================================================

variable "env" {
  type    = string
  default = "dev"
}


variable "presentation" {
  default = ""
}

variable "application" {
  default = ""
}

variable "database" {
  default = ""
}

variable "security_group_ids" {
  default = ""
}

variable "key_name" {
  default = ""
}

variable "presentation_private_ip" {
  default = ""
}

variable "application_private_ip" {
  default = ""
}

variable "database_private_ip" {
  default = ""
}

variable "path" {
  default = "../file/test.pem"
}

variable "destination" {
  default = "/home/ec2-user/.ssh/test.pem"
}

variable "type" {
  default = "ssh"
}

variable "user" {
  default = "ec2-user"
}

variable "first_name" {
  default = "presentatione"
}

variable "second_name" {
  default = "application"
}

variable "third_name" {
  default = "database"
}

variable "associate_public_ip" {
  type    = bool
  default = true
}

locals {
  key = file("C:/vpc_02/file/test.pem")
}
