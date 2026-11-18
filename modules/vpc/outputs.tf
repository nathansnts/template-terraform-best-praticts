output "vpc_id" {
  description = "vpc_id disponível para composição."
  value       = aws_vpc.this.id
}
output "subnet_ids_by_tier" {
  description = "subnet_ids_by_tier disponível para composição."
  value       = { for tier in local.tiers : tier => [for key, s in var.subnets : aws_subnet.this[key].id if s.tier == tier] }
}
output "route_table_ids_by_tier" {
  description = "route_table_ids_by_tier disponível para composição."
  value       = { for tier, rt in aws_route_table.this : tier => rt.id }
}
output "nat_gateway_id" {
  description = "nat_gateway_id disponível para composição."
  value       = aws_nat_gateway.this.id
}
output "internet_gateway_id" {
  description = "internet_gateway_id disponível para composição."
  value       = aws_internet_gateway.this.id
}
