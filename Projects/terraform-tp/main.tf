# Declare a provider version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Accepts all 5.x versions
    }
  }
}


# Declaring the AWS provider and using a variable for the region
provider "aws" {
  region = var.aws_region
}

# Creating an S3 bucket using variables for bucket name and tag
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name # Using a variable for the bucket name
  count  = "${var.bucket_count}-${count.index}"
  tags = {
    Name = "${var.bucket_tag_name}-${count.index}"
  }
}

# Output the ARN of buckets
output "bucket_arn" {
  description = "ARN du bucket"
  value       = [for b in aws_s3_bucket.my_bucket : b.bucket]
}

output "bucket_ids" {
  value = [for b in aws_s3_bucket.my_bucket : b.id]
}


# Imports 
# Define the bucket resource without specifying attributes
resource "aws_instance" "imported_instance" {
  ami           = "" # Placeholder
  instance_type = "" # Placeholder
}
# terraform import aws_instance.imported_instance i-0abcd1234efgh5678



