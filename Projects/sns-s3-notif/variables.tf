variable "bucket_name" {
  description = "Nom du bucket S3"
  type        = string
}

variable "sns_topic_name" {
  description = "Nom du topic SNS"
  type        = string
}

variable "email" {
  description = "Email pour la souscription SNS"
  type        = string
}

variable "region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}
