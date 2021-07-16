variable "queue_name" {
  description = "The name of the SQS queue"
  type = string
}

variable "dead_letter_queue_name" {
  description = "The name of the SQS dead letter queues"
  type = string
}

variable "is_fifo_queue" {
  description = "Should be true if the SQS queue should be of type FIFO"
  default = false
  type = bool
}

variable "kms_key" {
  description = "KMS encryption key for SQS queues"
  default = "alias/aws/sqs"
  type = string
}

variable "cloudwatch_alarm_name" {
  description = "The name of the CLoudWatch alarm for the dead letter queue"
  type = string
}

variable "cloudwatch_alarm_sns_topic" {
  description = "The ARN of an SNS topic CloudWatch should send messages to"
  type = string
}

variable "evaluation_periods" {
  description = "The number of time periods the CloudWatch alarm is in alarm state before triggering the alarm"
  default = 1
  type = number
}

variable "threshold" {
  description = "The number of messages sent to the dead letter queue in one period that should trigger an alarm"
  default = 1
  type = number
}

variable "period" {
  description = "The timeframe (in seconds) to evaluate if new messages is sent to dead letter queue"
  default = 300
  type = number
}
