resource "aws_subnet" "presentation" {
  vpc_id            = aws_vpc.vpc.id
  for_each          = { for x in var.presentation : x.cidr_block => x }
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = "presentation"
  }
}
#-----------------------------------------------------------------
resource "aws_subnet" "application" {
  vpc_id            = aws_vpc.vpc.id
  for_each          = { for x in var.application : x.cidr_block => x }
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = "application"
  }
}
#------------------------------------------------------------------
resource "aws_subnet" "database" {
  vpc_id            = aws_vpc.vpc.id
  for_each          = { for x in var.database : x.cidr_block => x }
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = "database"
  }
}



    