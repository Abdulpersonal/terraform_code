resource "aws_lambda_function" "terraform_lambda_func" {
  filename      = "${path.module}/pyfile/python.zip"
  function_name = var.lambda[0]
  role          = aws_iam_role.lambda_role.arn
  handler       = "index.main"
  runtime       = var.lambda[1]
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}