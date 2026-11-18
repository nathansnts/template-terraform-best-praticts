output "cluster_name" {
  description = "cluster_name disponível para composição."
  value       = aws_eks_cluster.this.name
}
output "cluster_endpoint" {
  description = "cluster_endpoint disponível para composição."
  value       = aws_eks_cluster.this.endpoint
}
output "cluster_arn" {
  description = "cluster_arn disponível para composição."
  value       = aws_eks_cluster.this.arn
}
