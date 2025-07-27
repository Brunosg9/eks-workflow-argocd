resource "aws_instance" "ec2" {
  ami                         = var.ec2.ami
  instance_type               = var.ec2.instance_type
  count                       = 1
  key_name                    = aws_key_pair.ec2_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.this.id] // use o ID do seu security group
  subnet_id                   = aws_subnet.public[0].id
  tags = {Name = var.ec2.tags["Name"]
  }

  root_block_device {
    volume_type = "gp3"
    volume_size = 50
  }
}

