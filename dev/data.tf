data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_security_group" "name" {
  tags = {
    Name = "test"
  }
  depends_on = [module.vpc]
}

data "aws_subnet" "presentation" {
  tags = {
    Name = "presentation"
  }
  depends_on = [module.vpc]
}

data "aws_subnet" "application" {
  tags = {
    Name = "application"
  }
  depends_on = [module.vpc]
}

data "aws_subnet" "database" {
  tags = {
    Name = "database"
  }
  depends_on = [module.vpc]
}