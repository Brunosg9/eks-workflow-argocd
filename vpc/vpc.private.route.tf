resource "aws_route_table" "private" {
  count   = length(var.vpc_id.private_route_table_name)
  vpc_id  = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this[count.index].id
  }
  tags = {
    Name = "${var.environment}-${var.vpc_id.private_route_table_name[0]}"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}