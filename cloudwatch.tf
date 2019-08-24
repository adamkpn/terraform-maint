#----root/cloudwatch.tf-----
#----definition for a cloudwatch rule to stop instances at 20:00 every day----
resource "aws_cloudwatch_event_rule" "tf_stop_ec2_instances_cloudwatch" {
    name = "stop_ec2_instances_cloudwatch"
    description = "Fires at 20:00 every day"
    schedule_expression = "cron(0 20 * * ? *)"
}

#----event target for a cloudwatch rule to stop instances----
resource "aws_cloudwatch_event_target" "tf_stop_ec2_instances_cloudwatch" {
    rule = "${aws_cloudwatch_event_rule.tf_stop_ec2_instances_cloudwatch.name}"
    arn = "${aws_lambda_function.stop_instances.arn}"
}

#----definition for a cloudwatch rule to start instances at 08:00 every day----
resource "aws_cloudwatch_event_rule" "tf_start_ec2_instances_cloudwatch" {
    name = "start_ec2_instances_cloudwatch"
    description = "Fires at 08:00 every day"
    schedule_expression = "cron(0 8 * * ? *)"
}

#----event target for a cloudwatch rule to start instances----
resource "aws_cloudwatch_event_target" "tf_start_ec2_instances_cloudwatch" {
    rule = "${aws_cloudwatch_event_rule.tf_start_ec2_instances_cloudwatch.name}"
    arn = "${aws_lambda_function.start_instances.arn}"
}