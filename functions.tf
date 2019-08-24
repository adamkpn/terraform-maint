#----root/functions.tf-----

#----stop instances function----
resource "aws_lambda_function" "stop_instances" {
  role             = "${aws_iam_role.lambda_exec_role.arn}"
  handler          = "${var.handler}"
  runtime          = "${var.runtime}"
  filename         = "stop_instances.zip"
  function_name    = "${var.function_name_to_stop_instances}"
  source_code_hash = "${base64sha256(filebase64("stop_instances.zip"))}"
}

#----start instances function----
resource "aws_lambda_function" "start_instances" {
  role             = "${aws_iam_role.lambda_exec_role.arn}"
  handler          = "${var.handler}"
  runtime          = "${var.runtime}"
  filename         = "start_instances.zip"
  function_name    = "${var.function_name_to_start_instances}"
  source_code_hash = "${base64sha256(filebase64("start_instances.zip"))}"
}
