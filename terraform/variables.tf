variable "env" {
  description = "Name of lambda environment (e.g. prod, dev, qa)"
}

variable "aws_region" {
  description = "AWS region"
}

variable "lambda_deployment_pkg" {
  description = "S3 key for lambda deployment package"
}

variable "lambda_function_name" {
  description = "Name of lambda function"
}

variable "lambda_handler" {
  description = "Nambe of lambda handler"
}

variable "lambda_runtime" {
  description = "Lambda runtime"
}

variable "lambda_description" {
  description = "Description of lambda function"
}

variable "lambda_environment_variables" {
    type    = "map"
    default = {}
}

variable "lambda_timeout" {
  default = "180"
}

variable "lambda_memory_size" {
  description   = "Lambda memory size"
  default       = "128"
}