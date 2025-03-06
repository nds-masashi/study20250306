resource "aws_db_subnet_group" "db_subnet_gp" {
  name       = "db-subnet-gp"
  subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.private_subnet2.id]

  tags = {
    Name = "${var.resourceName}-db-subnet-group"
  }
}

resource "aws_db_instance" "db" {
  identifier              = "${var.resourceName}-db"
  allocated_storage       = 10
  db_name                 = "postgres"
  engine                  = "postgres"
  engine_version          = "15.12"
  instance_class          = "db.t3.micro"
  username                = "postgres"
  password                = "postgres"
  skip_final_snapshot     = true
  multi_az                = false
  backup_retention_period = 0
  publicly_accessible     = true
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_gp.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]

  tags = {
    Name = "${var.resourceName}-db"
  }
}