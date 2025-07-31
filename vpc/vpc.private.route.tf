data "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id
  filter {
    name   = "association.main"
    values = ["true"]
  }
}

resource "aws_route" "private_nat" {
  route_table_id         = data.aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this[0].id
}

resource "aws_ec2_tag" "private_route_table_name" {
  resource_id = data.aws_route_table.private.id
  key         = "Name"
  value       = "${var.environment}-${var.vpc_id.private_route_table_name[0]}"
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = data.aws_route_table.private.id
}