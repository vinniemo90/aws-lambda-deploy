data "aws_s3_bucket_object" "lambda_deployment_pkg" {
    bucket = "${var.bucket}"
    key = "${var.lambda_deployment_pkg}"
}

resource "aws_lambda_function" "lambda_function" {
  s3_bucket        = "${data.aws_s3_bucket_object.lambda_deployment_pkg.bucket}"
  s3_key           = "${data.aws_s3_bucket_object.lambda_deployment_pkg.key}"
  function_name    = "${var.lambda_function_name}"
  role             = "${aws_iam_role.iam_for_lambda.arn}"
  handler          = "${var.lambda_handler}"
  runtime          = "${var.lambda_runtime}"
  timeout          = "${var.lambda_timeout}"
  memory_size      = "${var.lambda_memory_size}"
  description      = "${var.lambda_description}"

  environment {
    variables = "${var.lambda_environment_variables}"
  }
}

resource "aws_lambda_alias" "lambda_alias" {
  name             = "testalias"
  description      = "a sample description"
  function_name    = "${aws_lambda_function.lambda_function.arn}"
  function_version = "LATEST"
}