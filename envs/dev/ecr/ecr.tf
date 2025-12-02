resource "aws_ecr_repository" "kube_rca_backend" {
  name                 = "kube-rca-backend"
  image_tag_mutability = "MUTABLE"
  force_delete         = false
}

resource "aws_ecr_repository" "kube_rca_frontend" {
  name                 = "kube-rca-frontend"
  image_tag_mutability = "MUTABLE"
  force_delete         = false
}
