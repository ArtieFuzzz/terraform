variable "provider_region" {
  description = "The region of the provider"
  type = string
  default = "ap-southeast-2"
}

variable "bucket_name" {
  description = "The name of the S3 Bucket"
  type = string
}