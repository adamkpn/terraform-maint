#----root/security.tf-----
#----create iam policy-----
resource "aws_iam_role" "tf_lambda_exec_role" {
  name        = "tf_lambda_exec"
  path        = "/"
  description = "Allows Lambda Function to call AWS services..."

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}