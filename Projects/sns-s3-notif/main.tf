terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
}

# SNS Topic
resource "aws_sns_topic" "s3_alerts" {
  name = var.sns_topic_name
}

# SNS Topic Policy
resource "aws_sns_topic_policy" "sns_policy" {
  arn = aws_sns_topic.s3_alerts.arn

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "s3.amazonaws.com"
        },
        Action   = "SNS:Publish",
        Resource = aws_sns_topic.s3_alerts.arn,
        Condition = {
          ArnLike = {
            "aws:SourceArn" : aws_s3_bucket.bucket.arn
          }
        }
      }
    ]
  })
}

# SNS Email Subscription
resource "aws_sns_topic_subscription" "email_alert" {
  topic_arn = aws_sns_topic.s3_alerts.arn
  protocol  = "email"
  endpoint  = var.email
}

# S3 Bucket Notification → SNS
resource "aws_s3_bucket_notification" "s3_notification" {
  bucket = aws_s3_bucket.bucket.id

  topic {
    topic_arn = aws_sns_topic.s3_alerts.arn
    events    = ["s3:ObjectCreated:*"]
  }

  depends_on = [aws_sns_topic_subscription.email_alert]
}
