resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

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

resource "aws_iam_policy_attachment" "lambda_role_policies" {
    role = "${aws_iam_role.iam_for_lambda.name}"
    count = "${length(var.lambda_role_policies)}"
    policy_arn = "${var.lambda_role_policies[count.index]}"
}