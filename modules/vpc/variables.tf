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
