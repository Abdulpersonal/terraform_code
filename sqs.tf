resource "aws_sqs_queue" "sqs_queue" {
  name                      = var.sqs
  delay_seconds             = 2
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = "Dev"
  }
}