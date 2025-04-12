# Declaring a variable for the AWS region
variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1" # Optional default
}

# Declaring a variable for the bucket name
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

# Declaring a variable for the tag name
variable "bucket_tag_name" {
  description = "Value for the Name tag of the bucket"
  type        = string
}

# Number of S3 buckets to create
variable "bucket_count" {
  description = "How many buckets to create"
  type        = number
  default     = 1
}
