output "bucket_url" {
	description = "The URL / Domain for the bucket created."
	value = aws_s3_bucket.bucket.website_domain
}

/*
output "bucket_policy" {
	description = "The policy for the bucket created."
	value = aws_s3_bucket.bucket.policy
} */