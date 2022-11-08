output "rds_id" {
  description = "Endpoint of the RDS instance"
  value       = [aws_db_instance.mydb_instance.endpoint, aws_db_instance.mydb_instance.arn]
}

output "sqs_id" {
  description = "Endpoint of SQS"
  value       = aws_sqs_queue.sqs_queue.arn
}

output "SSM" {
  description = "Paramstore name"
  value       = aws_ssm_parameter.rdshost_address.name
}

output "role" {
  description = "Assigned Role"
  value       = [aws_iam_role.lambda_role.arn, aws_iam_role.lambda_role.name]

}

output "Lambda" {
  description = "Lambda function name"
  value       = aws_lambda_function.terraform_lambda_func.arn
}



