# resource "aws_subnet" "private" {
#   count                     = length(var.vpc_id.private_subnet_name)
#   vpc_id                    = aws_vpc.this.id
#   cidr_block                = var.vpc_id.private_subnet_name[count.index].cidr_block
#   availability_zone         = var.vpc_id.private_subnet_name[count.index].availability_zone
#   map_public_ip_on_launch   = var.vpc_id.private_subnet_name[count.index].map_public_ip_on_launch
#   tags = {
#     Name = "${var.environment}-${var.vpc_id.private_subnet_name[count.index].name}"
#   }
# }
