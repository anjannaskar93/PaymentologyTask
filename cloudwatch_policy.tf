resource "aws_iam_policy" "cloudwatch_policy" {
  name        = "cloudwatch_policy"
  description = "Policy for CloudWatch to access resources"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
          "elasticloadbalancing:Describe*",
          "autoscaling:Describe*",
          "rds:Describe*",
          "cloudfront:Get*",
          "cloudwatch:*",
          "logs:*",
          "sns:*",
          "sqs:*",
          "dynamodb:List*",
          "dynamodb:Describe*",
          "dynamodb:Get*",
          "lambda:Get*",
          "lambda:List*",
          "lambda:InvokeFunction"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })

  tags = {
    Name = "cloudwatch_policy"
  }
}
