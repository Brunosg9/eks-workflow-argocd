resource "aws_route_table" "private" {
  count   = length(var.vpc_id.private_route_table_name)
  vpc_id  = aws_vpc.this.id
  tags = {
    Name = "${var.environment}-${var.vpc_id.private_route_table_name[count.index]}"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private[count.index].id
}