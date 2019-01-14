output "lambda_function_arn" {
    value = "${aws_lambda_function.lambda_function.arn}"
}

output "lambda_function_role_arn" {
    value = "${aws_iam_role.iam_for_lambda.arn}"
}