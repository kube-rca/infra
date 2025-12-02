locals {
  group_name       = "kube-rca-user-group"
  group_membership = "${local.group_name}-members"

  user_names = [
    "hwb",
    "ktj",
    "cbh",
    "hjk",
  ]

  managed_policy_arns = [
    "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
    "arn:aws:iam::aws:policy/PowerUserAccess",
  ]
}

resource "aws_iam_user" "users" {
  for_each = toset(local.user_names)

  name = each.value
  path = "/"
}

resource "aws_iam_group" "kube_rca_user_group" {
  name = local.group_name
  path = "/"
}

resource "aws_iam_group_membership" "kube_rca_user_group_members" {
  name  = local.group_membership
  users = sort([for user in aws_iam_user.users : user.name])
  group = aws_iam_group.kube_rca_user_group.name
}

resource "aws_iam_policy" "force_mfa" {
  name = "Force-MFA"
  path = "/"

  policy = file("${path.module}/template/force_mfa_policy.json")
}

resource "aws_iam_group_policy_attachment" "force_mfa" {
  group      = aws_iam_group.kube_rca_user_group.name
  policy_arn = aws_iam_policy.force_mfa.arn
}

resource "aws_iam_group_policy_attachment" "managed" {
  for_each = toset(local.managed_policy_arns)

  group      = aws_iam_group.kube_rca_user_group.name
  policy_arn = each.value
}
