resource "aws_sqs_queue" "Sampion_queue" {
  name                      = "My-Queue100"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.Sampion_queue_deadletter.arn
    maxReceiveCount     = 10
  })

  tags = {
    Environment = "production"
  }
}