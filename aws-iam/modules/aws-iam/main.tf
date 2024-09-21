# AWS Terraform provider documentation was referenced for defining these resources

# Create IAM role with no permissions
resource "aws_iam_role" "role" {
  name = "${var.resource_suffix}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = { "AWS": var.aws_account_id }
      },
    ]
  })
}

# Create policy to allow usage of the above role
resource "aws_iam_policy" "policy" {
  name = "${var.resource_suffix}-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "sts:AssumeRole",
        ]
        Effect   = "Allow"
#        Resource = "arn:aws:iam::${var.aws_account_id}:role/${var.resource_suffix}-role"
        Resource = aws_iam_role.role.arn 
      },
    ]
  })
}

# Create group
resource "aws_iam_group" "group" {
  name = "${var.resource_suffix}-group"
}

# Attach group to policy
resource "aws_iam_group_policy_attachment" "attachment" {
  group      = aws_iam_group.group.name
  policy_arn = aws_iam_policy.policy.arn
}

# Create user
resource "aws_iam_user" "user" {
  name = "${var.resource_suffix}-user"
}

# Add user to group
resource "aws_iam_user_group_membership" "membership" {
  user = aws_iam_user.user.name

  groups = [
    aws_iam_group.group.name,
  ]
}
