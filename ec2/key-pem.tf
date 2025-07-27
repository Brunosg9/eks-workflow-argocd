resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "pem_key" {
  content         = tls_private_key.ec2_key.private_key_pem
  filename        = "${path.root}/ec2_key.pem"   // nome igual ao key_name
  file_permission = "0600"
}

resource "aws_key_pair" "ec2_key" {
  key_name   = "ec2_key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

output "key_pair_name" {
  value = aws_key_pair.ec2_key.key_name
}