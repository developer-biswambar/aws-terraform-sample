provider "aws" {
  region = "ap-south-1"
}

#data "archive_file" "lambda" {
#  type        = "zip"
#  source_file = "lambda.java"
#  output_path = "lambda_function_payload.zip"
#}

resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a
  # path.module in the filename.
  filename      = "java/sample-lambda/target/sample-lambda-1.0-SNAPSHOT.jar"
  function_name = "sample-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "in.learnaws.Handler"

  runtime = "java11"

  environment {
    variables = {
      foo1 = "bar1",
      foo2 = "bar2"
    }
  }
}