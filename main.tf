module "queue" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 3.1"

  name = var.queue_name
  fifo_queue = var.is_fifo_queue
  kms_master_key_id = var.kms_key

  redrive_policy = jsonencode({
    deadLetterTargetArn = module.dead_letter_queue.sqs_queue_arn,
    maxReceiveCount = 5
  })
}

module "dead_letter_queue" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "~> 3.1"

  name = var.dead_letter_queue_name
  fifo_queue = var.is_fifo_queue
  kms_master_key_id = var.kms_key
}
