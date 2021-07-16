output "sqs_queue_arn" {
  value = module.queue.sqs_queue_arn
}

output "sqs_dead_letter_queue_arn" {
  value = module.dead_letter_queue.sqs_queue_arn
}

output "cloud_watch_alarm_arn" {
  value = module.dlq_alarm.cloudwatch_metric_alarm_arn
}
