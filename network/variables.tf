#=======================VPC==========================================================
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

#====================PRESENTATION SUBNET==============================================
variable "presentation" {
  description = "List of maps of egress rules to set on the default security group"
  type        = list(map(string))

}

#====================APPLICATION SUBNET===============================================
variable "application" {
  description = "List of maps of egress rules to set on the default security group"
  type        = list(map(string))

}

#====================DATABASE SUBNET===================================================
variable "database" {
  description = "List of maps of egress rules to set on the default security group"
  type        = list(map(string))

}
#===================ROUTE TABLE========================================================
variable "public_route" {
  type    = string
  default = "0.0.0.0/0"
}

#===================SECURITY GROUP=====================================================
variable "ingress_rule" {
  description = "List of maps of egress rules to set on the default security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rule" {
  description = "List of maps of egress rules to set on the default security group"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
#===================APPLICATION RULES===================================================
variable "application_ingress_rule" {
  description = "List of maps of egress rules to set on the default security group"
  type = list(object({
    rule_no    = number
    action     = string
    cidr_block = any
    from_port  = number
    to_port    = number
    protocol   = string
  }))
}

variable "application_egress_rule" {
  description = "List of maps of egress rules to set on the default security group"
  type = list(object({
    rule_no    = number
    action     = string
    cidr_block = any
    from_port  = number
    to_port    = number
    protocol   = string
  }))
}
#===================DATABASE RULES======================================================
variable "database_ingress_rule" {
  description = "List of maps of egress rules to set on the default security group"
  type = list(object({
    rule_no    = number
    action     = string
    cidr_block = any
    from_port  = number
    to_port    = number
    protocol   = string
  }))
}

variable "database_egress_rule" {
  description = "List of maps of egress rules to set on the default security group"
  type = list(object({
    rule_no    = number
    action     = string
    cidr_block = any
    from_port  = number
    to_port    = number
    protocol   = string
  }))
}
#===================TEST================================================================




