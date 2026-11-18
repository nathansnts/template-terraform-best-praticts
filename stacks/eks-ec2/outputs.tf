output "vpc_id" {
  description = "vpc_id disponível para composição."
  value       = module.vpc.vpc_id
}
output "subnet_ids_by_tier" {
  description = "subnet_ids_by_tier disponível para composição."
  value       = module.vpc.subnet_ids_by_tier
}
output "cluster_name" {
  description = "cluster_name disponível para composição."
  value       = module.eks.cluster_name
}
output "cluster_endpoint" {
  description = "cluster_endpoint disponível para composição."
  value       = module.eks.cluster_endpoint
}
output "cluster_arn" {
  description = "cluster_arn disponível para composição."
  value       = module.eks.cluster_arn
}
output "instance_id" {
  description = "instance_id disponível para composição."
  value       = module.ec2.instance_id
}
output "private_ip" {
  description = "private_ip disponível para composição."
  value       = module.ec2.private_ip
}
