resource "aws_security_group" "this" {
  name        = var.vpc_id.security_group_name
  description = "Security group for ${var.environment} environment"
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "${var.environment}-${var.vpc_id.security_group_name}"
  }

  ingress {
    description      = "Allow HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "SSH access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["187.180.212.103/32"]
  }
  ingress {
    description      = "Allow POSTGRESQL"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    description      = "Allow all outbound"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

