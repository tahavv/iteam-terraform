output "sqs_queue_url" {
  value = aws_sqs_queue.s3_event_queue.id
}

output "sqs_queue_arn" {
  value = aws_sqs_queue.s3_event_queue.arn
}

output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.bucket
}
