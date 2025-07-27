# resource "aws_nat_gateway" "this" {
#   count         = length(var.vpc_id.nat_gateway_name)
#   allocation_id = aws_eip.this[count.index].id
#   subnet_id     = aws_subnet.public[count.index].id
#   tags = { Name = "${var.environment}-${var.vpc_id.nat_gateway_name[count.index]}" }
#   depends_on    = [aws_internet_gateway.this]
# }
