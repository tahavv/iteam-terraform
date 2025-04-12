output "s3_bucket_name" {
  description = "The name of the created S3 bucket"
  value       = aws_s3_bucket.bucket.bucket
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic"
  value       = aws_sns_topic.s3_alerts.arn
}

output "email_subscription_arn" {
  description = "The ARN of the email subscription"
  value       = aws_sns_topic_subscription.email_alert.arn
}
