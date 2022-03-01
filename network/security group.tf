resource "aws_security_group" "example" {
  name   = "security group"
  vpc_id = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.ingress_rule
    content {
      from_port   = lookup(ingress.value, "from_port", 0)
      to_port     = lookup(ingress.value, "to_port", 0)
      protocol    = lookup(ingress.value, "protocol", "-1")
      cidr_blocks = lookup(ingress.value, "cidr_blocks", null)
    }
  }

  dynamic "egress" {
    for_each = var.egress_rule
    content {
      from_port   = lookup(egress.value, "from_port", 0)
      to_port     = lookup(egress.value, "to_port", 0)
      protocol    = lookup(egress.value, "protocol", "-1")
      cidr_blocks = lookup(egress.value, "cidr_blocks", null)
    }
  }

  tags = {
    Name = "test"
  }
}


