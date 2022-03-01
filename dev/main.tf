provider "aws" {
  region     = var.aws_region
  access_key = ""
  secret_key = ""
}
#--------------------------------------------------------------


terraform {
  backend "s3" {
    bucket = "stagion-test-backend"
    key    = "dev/network/terraform.tfstate"
    region = "us-east-1"
  }
}


#--------------------------------------------------------------
module "ec2" {
  source                  = "../ec2"
  ami                     = data.aws_ami.latest_amazon_linux.id
  instance_type           = var.instance_type
  env                     = var.environment
  security_group_ids      = data.aws_security_group.name.id
  presentation            = data.aws_subnet.presentation.id
  application             = data.aws_subnet.application.id
  database                = data.aws_subnet.database.id
  key_name                = var.key_name
  presentation_private_ip = var.presentation_private_ip
  application_private_ip  = var.application_private_ip
  database_private_ip     = var.database_private_ip
}


module "vpc" {
  source = "../network"


  #--------------------------------------------------------------
  presentation = [{
    cidr_block        = var.presentation_subnet
    availability_zone = var.presentation_zone

  }]
  #--------------------------------------------------------------
  application = [{
    cidr_block        = var.application_subnet
    availability_zone = var.application_zone

  }]
  #--------------------------------------------------------------
  database = [{
    cidr_block        = var.database_subnet
    availability_zone = var.database_zone
  }]
  #--------------------------------------------------------------
  ingress_rule = [{
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = "${var.ingress_rule}"
  }]

  egress_rule = [{
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = "${var.egress_rule}"
  }]
  #--------------------------------------------------------------
  application_ingress_rule = [{
    rule_no    = 1
    action     = "allow"
    cidr_block = var.application_ingress
    from_port  = 0
    to_port    = 0
    protocol   = "all"
    },
    {
      rule_no    = 2
      action     = "allow"
      cidr_block = var.application_ingress_rule
      from_port  = 0
      to_port    = 0
      protocol   = "all"
    }
  ]
  #--------------------------------------------------------------
  application_egress_rule = [{
    rule_no    = 1
    action     = "allow"
    cidr_block = var.application_egress
    from_port  = 0
    to_port    = 0
    protocol   = "all"
    },
    {
      rule_no    = 2
      action     = "allow"
      cidr_block = var.application_egress_rule
      from_port  = 0
      to_port    = 0
      protocol   = "all"
    }
  ]
  #--------------------------------------------------------------
  database_ingress_rule = [{
    rule_no    = 1
    action     = "allow"
    cidr_block = var.database_ingress
    from_port  = 0
    to_port    = 0
    protocol   = "all"
  }]

  database_egress_rule = [{
    rule_no    = 1
    action     = "allow"
    cidr_block = var.database_egress
    from_port  = 0
    to_port    = 0
    protocol   = "all"
  }]

}

