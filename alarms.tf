module "dlq_alarm" {
  source  = "terraform-aws-modules/cloudwatch/aws//modules/metric-alarm"
  version = "~> 2.1"

  alarm_name          = var.cloudwatch_alarm_name
  alarm_description   = "Alarm that triggers whenever a message is sent to this queue: ${module.dead_letter_queue.sqs_queue_name}"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  threshold           = var.threshold
  period              = var.period
  unit                = "Count"
  treat_missing_data  = "missing"

  namespace   = "AWS/SQS"
  metric_name = "NumberOfMessagesSent"
  statistic   = "Sum"

  dimensions = {
    "QueueName": module.dead_letter_queue.sqs_queue_name
  }

  alarm_actions = [var.cloudwatch_alarm_sns_topic_arn]
}
