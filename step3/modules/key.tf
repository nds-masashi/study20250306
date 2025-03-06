resource "tls_private_key" "ec2_private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ec2_keypair" {
  key_name   = var.keyName
  public_key = tls_private_key.ec2_private_key.public_key_openssh

  tags = {
    Name = "${var.resourceName}-keypair"
  }
}

resource "aws_secretsmanager_secret" "ec2_secret" {
  name                           = "${var.keyName}-002"
  recovery_window_in_days        = 0 # 削除ですぐに消す
  force_overwrite_replica_secret = true

  tags = {
    Name = "${var.resourceName}-secret"
  }
}

resource "aws_secretsmanager_secret_version" "ec2_secret" {
  secret_id     = aws_secretsmanager_secret.ec2_secret.id
  secret_string = tls_private_key.ec2_private_key.private_key_pem
}