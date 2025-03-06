resource "aws_security_group" "ec2_sg" {
  name        = "allow-ssh-ec2-sg"
  description = "Allow ssh ec2 sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowAccessIp]
    description = "ssh"
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "https"
  }
}

resource "aws_vpc_security_group_egress_rule" "rds_ec2_rule" {
  security_group_id            = aws_security_group.ec2_sg.id
  from_port                    = 5432
  to_port                      = 5432
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.rds_sg.id
  description                  = "rds"
}

resource "aws_security_group" "rds_sg" {
  name        = "allow-rds-sg"
  description = "Allow rds sg"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
    description     = "rds"
  }
}