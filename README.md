# AWS SQS with dead letter queue and CloudWatch alarm
This is a Terraform module for creating SQS queues with DLQs (dead letter queues) connected to a CloudWatch alarm.

## Usage

#### Minimal example:
```terraform
module "aws_sqs_with_dlq_and_cloudwatch_alarm" {
  source  = "endre-synnes/aws-sqs-with-dlq-and-cloudwatch-alarm"
  version = "~> 0.1"
  
  queue_name                  = "my-queue"
  dead_letter_queue_name      = "my-dead-letter-queue"
  cloudwatch_alarm_name       = "my-cloudwatch-alarm"
  cloudwatch_alarm_sns_topic  = "my-sns-topic"
}
```

## Requirements
| Name      | Version   |
|-----------|-----------|
| terraform | >= 0.12.7 | 
| aws       | >= 2.30   | 


## Inputs
| Name                       | Description | Type | Default | Required |
|----------------------------|-------------|------|---------|----------|
| queue_name                 | The name of the SQS queue|`string`|`null`|yes|
| dead_letter_queue_name     | The name of the SQS dead letter queues|`string`|`null`|yes|
| is_fifo_queue              | Should be true if the SQS queue should be of type FIFO|`bool`|`false`|no|
| kms_key                    | KMS encryption key for SQS queues|`string`|`alias/aws/sqs`|no|
| cloudwatch_alarm_name      | The name of the CLoudWatch alarm for the dead letter queue|`string`|`null`|yes|
| cloudwatch_alarm_sns_topic | The ARN of an SNS topic CloudWatch should send messages to|`string`|`null`|yes|
| evaluation_periods         | The number of time periods the CloudWatch alarm is in alarm state before triggering the alarm|`number`|`1`|no|
| threshold                  | The number of messages sent to the dead letter queue in one period that should trigger an alarm|`number`|`1`|no|
| period                     | The timeframe (in seconds) to evaluate if new messages is sent to dead letter queue|`number`|`300`|no|

## Outputs
| Name                      | Description                                                |
|---------------------------|------------------------------------------------------------|
| sqs_queue_arn             | The ARN of the SQS queue                                   |
| sqs_dead_letter_queue_arn | The ARN of the dead letter queue                           |
| cloud_watch_alarm_arn     | The ARN of the Cloud Watch alarm for the dead letter queue |
