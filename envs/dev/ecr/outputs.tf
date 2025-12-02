output "backend-ecr-name" {
  value = aws_ecr_repository.kube_rca_backend.name
}

output "backend-ecr-url" {
  value = aws_ecr_repository.kube_rca_backend.repository_url
}

output "frontend-ecr-name" {
  value = aws_ecr_repository.kube_rca_frontend.name
}

output "frontend-ecr-url" {
  value = aws_ecr_repository.kube_rca_frontend.repository_url
}