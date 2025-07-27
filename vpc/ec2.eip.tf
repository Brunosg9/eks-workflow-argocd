# resource "aws_eip" "this" {
#     count       = length(var.vpc_id.nat_gateway_name)
#     domain      = "vpc"
#     tags = {Name = "${var.environment}-${var.vpc_id.nat_gateway_name[count.index]}"}
# }
# 