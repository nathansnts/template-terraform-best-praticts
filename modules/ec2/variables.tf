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
variable "subnet_id" {
  description = "Subnet privada."
  type        = string
  nullable    = false
}
variable "instance_type" {
  description = "Tipo de instância (PE-08)."
  type        = string
  nullable    = false
}
variable "ami_id" {
  description = "AMI regional (PE-08)."
  type        = string
  nullable    = false
}
variable "security_group_ids" {
  description = "SGs existentes com regras internas aprovadas (PE-06)."
  type        = list(string)
  nullable    = false
}
variable "instance_profile" {
  description = "Instance profile existente para acesso (PE-08)."
  type        = string
  nullable    = false
}
variable "root_volume_size" {
  description = "Tamanho do disco em GiB (PE-08)."
  type        = number
  nullable    = false
}
variable "root_volume_type" {
  description = "Tipo do volume (PE-08)."
  type        = string
  nullable    = false
}
variable "kms_key_arn" {
  description = "Chave KMS existente para o disco (PE-08)."
  type        = string
  nullable    = false
}
