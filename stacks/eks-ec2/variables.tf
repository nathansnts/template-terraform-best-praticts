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
variable "vpc_cidr" {
  description = "CIDR IPv4 da VPC (PE-02)."
  type        = string
  nullable    = false
}
variable "subnets" {
  description = "Subnets por chave estável; EKS exige duas AZs (PE-01)."
  type        = map(object({ tier = string, cidr = string, az = string }))
  nullable    = false
}
variable "nat_subnet_key" {
  description = "Chave da subnet pública do NAT (PE-07)."
  type        = string
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
variable "eks_security_group_ids" {
  description = "SGs adicionais existentes (PE-06)."
  type        = list(string)
  nullable    = false
}
variable "worker_launch_template_id" {
  description = "Launch Template existente: AMI EKS, bootstrap, disco KMS, IMDSv2, SGs e sem IP público (PE-04/06)."
  type        = string
  nullable    = false
}
variable "worker_launch_template_version" {
  description = "Versão numérica imutável do Launch Template (PE-04)."
  type        = string
  nullable    = false
}
variable "worker_capacity_type" {
  description = "Capacidade ON_DEMAND ou SPOT (PE-04)."
  type        = string
  nullable    = false
}
variable "ec2_instance_type" {
  description = "Tipo de instância (PE-08)."
  type        = string
  nullable    = false
}
variable "ec2_ami_id" {
  description = "AMI regional (PE-08)."
  type        = string
  nullable    = false
}
variable "ec2_security_group_ids" {
  description = "SGs existentes com regras internas aprovadas (PE-06)."
  type        = list(string)
  nullable    = false
}
variable "ec2_instance_profile" {
  description = "Instance profile existente para acesso (PE-08)."
  type        = string
  nullable    = false
}
variable "ec2_root_volume_size" {
  description = "Tamanho do disco em GiB (PE-08)."
  type        = number
  nullable    = false
}
variable "ec2_root_volume_type" {
  description = "Tipo do volume (PE-08)."
  type        = string
  nullable    = false
}
variable "ec2_kms_key_arn" {
  description = "Chave KMS existente para o disco (PE-08)."
  type        = string
  nullable    = false
}
