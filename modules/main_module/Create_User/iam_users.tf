resource "aws_iam_user" "new_user" {
   count   = length(var.iam_name)
   name = var.iam_name[count.index]
}
