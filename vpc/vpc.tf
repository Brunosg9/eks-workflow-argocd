resource "aws_vpc" "this" {
  cidr_block = var.vpc_id.cidr_block
  tags       = { Name = "${var.vpc_id.name}-${var.environment}" }
}