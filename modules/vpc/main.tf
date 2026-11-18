locals {
  tiers = toset(["private_eks", "private_ec2", "public"])
}
resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = merge(var.tags, { Name = var.name })
  lifecycle {
    precondition {
      condition     = alltrue([for s in values(var.subnets) : contains(local.tiers, s.tier) && can(cidrnetmask(s.cidr))]) && can(cidrnetmask(var.vpc_cidr))
      error_message = "Informe CIDRs IPv4 válidos e tiers private_eks, private_ec2 ou public."
    }
    precondition {
      condition     = length(distinct([for s in values(var.subnets) : s.az if s.tier == "private_eks"])) >= 2 && length([for s in values(var.subnets) : s if s.tier == "private_ec2"]) > 0
      error_message = "EKS exige pelo menos duas AZs; EC2 exige uma subnet privada."
    }
    precondition {
      condition     = try(var.subnets[var.nat_subnet_key].tier == "public", false)
      error_message = "O NAT deve usar uma chave existente do tier public."
    }
  }
}
resource "aws_subnet" "this" {
  for_each                = var.subnets
  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = false
  tags                    = merge(var.tags, { Name = "${var.name}-${each.key}" })
}
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = var.name })
}
resource "aws_eip" "nat" {
  domain = "vpc"
  tags   = merge(var.tags, { Name = "${var.name}-nat" })
}
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.this[var.nat_subnet_key].id
  depends_on    = [aws_internet_gateway.this]
  tags          = merge(var.tags, { Name = var.name })
}
resource "aws_route_table" "this" {
  for_each = local.tiers
  vpc_id   = aws_vpc.this.id
  tags     = merge(var.tags, { Name = "${var.name}-${each.key}" })
}
resource "aws_route_table_association" "this" {
  for_each       = var.subnets
  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.this[each.value.tier].id
}
resource "aws_route" "public" {
  route_table_id         = aws_route_table.this["public"].id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}
resource "aws_route" "private" {
  for_each               = toset(["private_eks", "private_ec2"])
  route_table_id         = aws_route_table.this[each.key].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
}
