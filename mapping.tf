resource "aws_lambda_event_source_mapping" "integrate" {
  event_source_arn = aws_sqs_queue.sqs_queue.arn
  function_name    = aws_lambda_function.terraform_lambda_func.arn

}
resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = each.value
  for_each = toset([
    aws_iam_policy.iam_policy_for_lambda.arn,
    aws_iam_policy.rdspolicy.arn,
    aws_iam_policy.sqspolicy.arn,
    aws_iam_policy.iam_policy_for_SSM.arn
  ])
}
  