resource "aws_security_group" "ec2_sg" {
  name        = "allow-ssh-ec2-sg"
  description = "Allow ssh ec2 sg"
  vpc_id      = var.defaultVpcId

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowAccessIp]
    description = "ssh"
  }
}