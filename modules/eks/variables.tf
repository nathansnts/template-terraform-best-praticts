variable "name" {
  description = "Nome definido pelo consumidor."
  type        = string
  nullable    = false
}
variable "tags" {
  description = "Tags adicionais; governança aplicada na raiz."
  type        = map(string)
  nullable    = false
  default     = {}
}
variable "subnet_ids" {
  description = "Subnets privadas em duas AZs."
  type        = list(string)
  nullable    = false
}
variable "kubernetes_version" {
  description = "Versão Kubernetes (PE-03)."
  type        = string
  nullable    = false
}
variable "cluster_role_arn" {
  description = "Role existente do cluster (PE-05)."
  type        = string
  nullable    = false
}
variable "node_role_arn" {
  description = "Role existente dos workers (PE-05)."
  type        = string
  nullable    = false
}
variable "worker_node_count" {
  description = "Quantidade de workers: dois conforme diagrama."
  type        = number
  nullable    = false
}
variable "worker_instance_type" {
  description = "Tipo dos workers (PE-04)."
  type        = string
  nullable    = false
}
variable "endpoint_private_access" {
  description = "Habilitar endpoint privado (PE-03)."
  type        = bool
  nullable    = false
}
variable "endpoint_public_access" {
  description = "Habilitar endpoint público (PE-03)."
  type        = bool
  nullable    = false
}
variable "public_access_cidrs" {
  description = "CIDRs autorizados para endpoint público (PE-03)."
  type        = list(string)
  nullable    = false
}
variable "enabled_cluster_log_types" {
  description = "Logs de control plane (PE-03)."
  type        = list(string)
  nullable    = false
}
variable "security_group_ids" {
  description = "SGs adicionais existentes (PE-06)."
  type        = list(string)
  nullable    = false
}
variable "worker_launch_template_id" {
  type        = string
  nullable    = false
  description = "Launch Template existente: AMI EKS, bootstrap, disco KMS, IMDSv2, SGs e sem IP público (PE-04/06)."
}
variable "worker_launch_template_version" {
  type        = string
  nullable    = false
  description = "Versão numérica imutável do Launch Template (PE-04)."
}
variable "worker_capacity_type" {
  type        = string
  nullable    = false
  description = "Capacidade ON_DEMAND ou SPOT (PE-04)."
}
