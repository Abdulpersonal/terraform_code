resource "aws_iam_role" "lambda_role" {
  name               = "rolelambda"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}
resource "aws_iam_policy" "iam_policy_for_lambda" {

  name        = "lambda_policy"
  path        = "/"
  description = "AWS IAM Policy for managing aws lambda role"
  policy      = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents"
     ],
     "Resource": "arn:aws:logs:*:*:*",
     "Effect": "Allow"
   }
 ]
}
EOF
}

resource "aws_iam_policy" "sqspolicy" {

  name = "sqspolicy"
  path = "/"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "sqs:DeleteMessage",
                "sqs:GetQueueUrl",
                "sqs:ListDeadLetterSourceQueues",
                "sqs:ChangeMessageVisibility",
                "sqs:PurgeQueue",
                "sqs:ReceiveMessage",
                "sqs:DeleteQueue",
                "sqs:SendMessage",
                "sqs:GetQueueAttributes",
                "sqs:ListQueueTags",
                "sqs:CreateQueue",
                "sqs:SetQueueAttributes"
            ],
            "Resource": "*"
        }    
    ]
}
EOF 
}



resource "aws_iam_policy" "rdspolicy" {

  name = "RDSpolicy"
  path = "/"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "rds:StartDBCluster",
                "rds:CreateDBSubnetGroup",
                "rds:ModifyDBParameterGroup",
                "rds:AddRoleToDBCluster",
                "rds:DeleteDBInstance",
                "rds:CreateDBSnapshot",
                "rds:DeleteDBSecurityGroup",
                "rds:AddRoleToDBInstance",
                "rds:CreateDBInstance",
                "rds:StartDBInstanceAutomatedBackupsReplication",
                "rds:CreateDBClusterEndpoint",
                "rds:StopDBCluster",
                "rds:CreateDBParameterGroup",
                "rds:StartDBInstance",
                "rds:RevokeDBSecurityGroupIngress",
                "rds:ModifyCurrentDBClusterCapacity",
                "rds:ResetDBClusterParameterGroup",
                "rds:RestoreDBClusterToPointInTime",
                "rds:CreateCustomDBEngineVersion",
                "rds:CopyDBSnapshot",
                "rds:CopyDBClusterSnapshot",
                "rds:StopDBInstance",
                "rds:CreateDBSecurityGroup",
                "rds:CreateDBInstanceReadReplica"
            ],
            "Resource": "*"
        }
    ]
}

EOF
}


resource "aws_iam_policy" "iam_policy_for_SSM" {

  name = "SSM_POLICY"
  path = "/"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:Describe*",
                "ssm:Get*",
                "ssm:List*"
            ],
            "Resource": "*"
        }
    ]
}
EOF
}