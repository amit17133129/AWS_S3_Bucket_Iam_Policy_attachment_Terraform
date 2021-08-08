resource "aws_iam_user_policy_attachment" "s3_bucket_for_iam_attach_user1" {
     user = var.iam_name[0]
     policy_arn = aws_iam_policy.user1_policy.arn
}

resource "aws_iam_user_policy_attachment" "s3_bucket_for_iam_attach_user2" {
     user =  var.iam_name[1]
     policy_arn = aws_iam_policy.user2_policy.arn
}

