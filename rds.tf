resource "aws_db_subnet_group" "database_group"{
    name = "database_subnet"
    subnet_ids = [aws_subnet.PrivateSub.id,aws_subnet.rds-privatesub.id]
}

resource "aws_db_instance" "Database" {
  allocated_storage    = 20
  engine               = var.db_engine
  engine_version       = "5.7"
  instance_class       = var.db_instance_type
  db_name              = "mydb"
  username             = var.db_user
  password             = var.db_pass
  db_subnet_group_name = aws_db_subnet_group.database_group.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot = true
}