output "role_name" {
  value = aws_iam_role.role.name
}

output "role_arn" {
  value = aws_iam_role.role.arn
}

output "policy_name" {
  value = aws_iam_policy.policy.name
}

output "policy_arn" {
  value = aws_iam_policy.policy.arn
}

output "group_name" {
  value = aws_iam_group.group.name
}

output "user_name" {
  value = aws_iam_user.user.name
}
