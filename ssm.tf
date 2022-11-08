resource "aws_ssm_parameter" "rdshost_address" {
  name  = "rdshost"
  type  = "String"
  value = aws_db_instance.mydb_instance.endpoint
}