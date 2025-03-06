resource "tls_private_key" "learn_ec2_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "learn_ec2_keypair" {
  key_name   = var.keyName
  public_key = tls_private_key.learn_ec2_private_key.public_key_openssh
}

resource "aws_secretsmanager_secret" "learn_ec2_secret" {
  name = var.keyName
}

resource "aws_secretsmanager_secret_version" "learn_ec2_secret" {
  secret_id     = aws_secretsmanager_secret.learn_ec2_secret.id
  secret_string = tls_private_key.learn_ec2_private_key.private_key_pem
}