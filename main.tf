provider "aws" {
  region = "ap-south-1"
#   access_key = var.access_key
#   secret_key = var.secret_key
}
/* terraform {
  required_version = "= 0.12.24"
}
# variable "access_key" {}

# variable "secret_key" {}

module "main_module"  {
    source = "./Create_Bucket"
    s3_buckets_names = var.s3_buckets_names
    
} */

# module "create_users"  {
#     source = "./Create_User"
#     iam_name = var.iam_name
# }

# module "create_roles"  {
#     source = "./Create_Role_Assign_Roles"
#     iam_policy_names = var.iam_policy_names
#     iam_name = var.iam_name
# }
