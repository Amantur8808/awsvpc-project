resource "aws_route_table" "public_subnet" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.public_route
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "Presentation Route Table"
  }
}

resource "aws_route_table_association" "note" {
  for_each       = aws_subnet.presentation
  subnet_id      = aws_subnet.presentation[each.key].id
  route_table_id = aws_route_table.public_subnet.id
}