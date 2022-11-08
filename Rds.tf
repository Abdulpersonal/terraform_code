resource "aws_db_instance" "mydb_instance" {
  allocated_storage    = 10
  db_name              = var.rds[0]
  engine               = var.rds[1]
  engine_version       = var.rds[2]
  instance_class       = var.rds[3]
  username             = var.rds[4]
  password             = var.rds[5]
  parameter_group_name = var.rds[6]
  skip_final_snapshot  = true
}
