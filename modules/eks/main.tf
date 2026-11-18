resource "aws_eks_cluster" "this" {
  name                      = var.name
  role_arn                  = var.cluster_role_arn
  version                   = var.kubernetes_version
  enabled_cluster_log_types = var.enabled_cluster_log_types
  vpc_config {
    subnet_ids              = var.subnet_ids
    security_group_ids      = var.security_group_ids
    endpoint_private_access = var.endpoint_private_access
    endpoint_public_access  = var.endpoint_public_access
    public_access_cidrs     = var.public_access_cidrs
  }
  tags = var.tags
  lifecycle {
    precondition {
      condition     = var.endpoint_private_access || var.endpoint_public_access
      error_message = "Habilite pelo menos um endpoint."
    }
    precondition {
      condition     = !var.endpoint_public_access || (length(var.public_access_cidrs) > 0 && alltrue([for c in var.public_access_cidrs : can(cidrnetmask(c)) && !endswith(c, "/0")]))
      error_message = "Endpoint público exige CIDRs IPv4 restritos."
    }
    precondition {
      condition     = var.worker_node_count == 2
      error_message = "O diagrama exige exatamente dois workers."
    }
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = [var.worker_instance_type]
  capacity_type   = var.worker_capacity_type
  # A AMI e o bootstrap são definidos no Launch Template existente.
  launch_template {
    id      = var.worker_launch_template_id
    version = var.worker_launch_template_version
  }
  scaling_config {
    desired_size = var.worker_node_count
    min_size     = var.worker_node_count
    max_size     = var.worker_node_count
  }
  tags = var.tags
  lifecycle {
    precondition {
      condition     = contains(["ON_DEMAND", "SPOT"], var.worker_capacity_type) && can(regex("^[1-9][0-9]*$", var.worker_launch_template_version))
      error_message = "Informe capacidade válida e versão numérica positiva do Launch Template."
    }
  }
}
