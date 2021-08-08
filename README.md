# AWS_S3_Bucket_Iam_Policy_attachment_Terraform

**Task Description:**
1. Use terraform modules to create buckets.
   - Bucket names should be passed as a local variable from main module to sub module
   - Create at least three buckets
2. Create two users using modules, user name should be passed as an input variable to the user creation module.
    Create two users
3. Create iam roles or policy using terraform modules and assign roles to two use so that they can access the bucket.
   - One user should have only list bucket permissions
   - Other user should have both read and write permissions.

`Program Structure`
- Main Module
	- Child Module "Create Bucket"
	- Child Module "Create User"
	- Child Module "Create Role and Assign Roles to users"
names of  bucket, users, roles should be passed as input parameters from main modules to child modules


----------------------------------------------------------------------------------------------------------------------------------------
Below is the tree graph you will find whch i created while creating this whole terraform IAC
```
C:.
└───main_module          **main module**
    ├───.terraform
    │   └───providers
    │       └───registry.terraform.io
    │           └───hashicorp
    │               └───aws
    │                   └───3.53.0
    │                       └───windows_amd64
    │   **child module** 
    ├───Create_Bucket
    ├───Create_Role_Assign_Roles
    └───Create_User
```
----------------------------------------------------------------------------------------------------------------------------------------

- We have to create first module folder for creating all the module. Inside module folder we have `main_module`, `main.tf`, `variable.tf`.
- `main_module` consists of three module as mentioned below.
    1. `Create_Bucket`            --> For creating s3 bucket
    2. `Create_Role_Assign_Roles` --> For creating IAM Roles and attaching to IAM User
    3. `Create_User`              --> For creating IAM Users

- Inside `main.tf` file you will have to provide the *provider* as `aws` and calling the respective modules as mentioned in above tree.
- Inside `variable.tf` file you will have to declare variables and its respective vlaues. As in this names of  bucket, users, roles should be passed as input parameters from main modules to child modules.
- All the module have varaible.tf file which will just for declaring the variables. While calling the module we have to to pass the values to the variables whih we have declared already.
- In S3 module you have to pass `s3_buckets_names` variable, in iam user module you have to pass `iam_name` variable whereas in role module we have to you have to pass `iam_policy_names` and `iam_name` varaibles.
- As per the task instruction, i have created two user i.e `IAM_user1` and ` IAM_user2`. 
- `IAM_user1` have all s3 bucket read, write, put permission whereas `IAM_user2` have onlu read permission.
- While decaling the policy of IAM Users elow is the difference mentioned.

----------------------------------------------------------------------------------------------------------------------------------------
IAM Policy for `IAM_user1`

As you can see below that, i have added only `AbortMultipartUpload`, `Get`, `List`, `Delete` and `PutObject` Permission in Actions section.

```
policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        `"s3:AbortMultipartUpload"`,
        `"s3:Get*"`,
        `"s3:List*"`,
        `"s3:Delete*"`,
        `"s3:PutObject"`
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
```
----------------------------------------------------------------------------------------------------------------------------------------

IAM Policy for `IAM_user2`
As you can see below that, i have added only `Get` and `List` Permission in Actions section.
	      
```
policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        `"s3:Get*"`,
        `"s3:List*"`
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
```
	      
----------------------------------------------------------------------------------------------------------------------------------------
Now we have to attach the policy to IAM Users. So, the detailed description you will find in `Create_Role_Assign_Roles` module.
After Seeting this code hit below commands.
- `terraform init`     --> will download the mdoules and aws providers.
- `terraform validate` --> will validate/chack the syntax of the code.
- `terraform plan`     --> Dry Run
- `terrfaorm apply`    --> final run to apply the changes.
