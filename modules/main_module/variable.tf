variable "s3_buckets_names" {
  type        = list
  default     = ["my-s3-bucket-terraform-devops-1", "my-s3-bucket-terraform-devops-2", "my-s3-bucket-terraform-devops-3"]
  description = "description"
}


variable "iam_policy_names" {
  type        = list
  default     = ["user_1_policy", "user_2_policy"]
  description = "description"
}


variable "iam_name" {
  type        = list
  default     = ["IAM_user1", "IAM_user2"]
  description = "description"
}

