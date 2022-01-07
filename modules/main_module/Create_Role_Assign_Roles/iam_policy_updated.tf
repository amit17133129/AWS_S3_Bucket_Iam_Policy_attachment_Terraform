resource "aws_iam_policy" "user1_policy" {
  name        = var.iam_policy_names[0]
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [ 
                "ec2:CreateTags", 
                "ec2:DescribeInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeAddresses", 
                "ec2:AssociateAddress",
                "ec2:DisassociateAddress",
                "ec2:DescribeRegions",
                "ec2:DescribeAvailabilityZones"
            ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Action": [ 
                "ec2:RunInstances", 
                "ec2:TerminateInstances", 
                "ec2:StartInstances",
                "ec2:StopInstances"
            ],
       "Effect": "Allow",
       "Resource": "*"
    }
  ]
}
EOF
}


resource "aws_iam_policy" "user2_policy" {
  name        = var.iam_policy_names[1]
  description = "A test policy"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action   = ["ec2:Describe*"],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
