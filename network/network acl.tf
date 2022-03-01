resource "aws_network_acl" "application" {
  for_each   = aws_subnet.application
  subnet_ids = [aws_subnet.application[each.key].id]
  vpc_id     = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.application_ingress_rule
    content {
      rule_no    = lookup(ingress.value, "rule_no", 1)
      action     = lookup(ingress.value, "action", "allow")
      from_port  = lookup(ingress.value, "from_port", 0)
      to_port    = lookup(ingress.value, "to_port", 0)
      protocol   = lookup(ingress.value, "protocol", "-1")
      cidr_block = lookup(ingress.value, "cidr_block", null)
    }
  }

  dynamic "ingress" {
    for_each = var.application_ingress_rule
    content {
      rule_no    = lookup(ingress.value, "rule_no", 1)
      action     = lookup(ingress.value, "action", "allow")
      from_port  = lookup(ingress.value, "from_port", 0)
      to_port    = lookup(ingress.value, "to_port", 0)
      protocol   = lookup(ingress.value, "protocol", "-1")
      cidr_block = lookup(ingress.value, "cidr_block", null)
    }
  }

  dynamic "egress" {
    for_each = var.application_egress_rule
    content {
      rule_no    = lookup(egress.value, "rule_no", 1)
      action     = lookup(egress.value, "action", "allow")
      from_port  = lookup(egress.value, "from_port", 0)
      to_port    = lookup(egress.value, "to_port", 0)
      protocol   = lookup(egress.value, "protocol", "-1")
      cidr_block = lookup(egress.value, "cidr_block", null)
    }
  }

  dynamic "egress" {
    for_each = var.application_egress_rule
    content {
      rule_no    = lookup(egress.value, "rule_no", 1)
      action     = lookup(egress.value, "action", "allow")
      from_port  = lookup(egress.value, "from_port", 0)
      to_port    = lookup(egress.value, "to_port", 0)
      protocol   = lookup(egress.value, "protocol", "-1")
      cidr_block = lookup(egress.value, "cidr_block", null)
    }
  }
}

resource "aws_network_acl" "database" {
  for_each   = aws_subnet.database
  subnet_ids = [aws_subnet.database[each.key].id]
  vpc_id     = aws_vpc.vpc.id

  dynamic "ingress" {
    for_each = var.database_ingress_rule
    content {
      rule_no    = lookup(ingress.value, "rule_no", 1)
      action     = lookup(ingress.value, "action", "allow")
      from_port  = lookup(ingress.value, "from_port", 0)
      to_port    = lookup(ingress.value, "to_port", 0)
      protocol   = lookup(ingress.value, "protocol", "-1")
      cidr_block = lookup(ingress.value, "cidr_block", null)
    }
  }

  dynamic "egress" {
    for_each = var.database_egress_rule
    content {
      rule_no    = lookup(egress.value, "rule_no", 1)
      action     = lookup(egress.value, "action", "allow")
      from_port  = lookup(egress.value, "from_port", 0)
      to_port    = lookup(egress.value, "to_port", 0)
      protocol   = lookup(egress.value, "protocol", "-1")
      cidr_block = lookup(egress.value, "cidr_block", null)
    }
  }
}


