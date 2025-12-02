output "group_name" {
  value = aws_iam_group.kube_rca_user_group.name
}

output "group_arn" {
  value = aws_iam_group.kube_rca_user_group.arn
}

output "group_users" {
  value = sort([for user in aws_iam_user.users : user.name])
}

output "force_mfa_policy_arn" {
  value = aws_iam_policy.force_mfa.arn
}
