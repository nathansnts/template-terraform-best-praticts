module "eks_ec2" {
  # No consumidor, substituir por git::<URL>//stacks/eks-ec2?ref=<TAG_SEMVER>.
  source                         = "../../stacks/eks-ec2"
  name                           = var.name
  tags                           = merge(var.tags, { Environment = var.environment, Owner = var.owner, CostCenter = var.cost_center, ManagedBy = "terraform" })
  vpc_cidr                       = var.vpc_cidr
  subnets                        = var.subnets
  nat_subnet_key                 = var.nat_subnet_key
  kubernetes_version             = var.kubernetes_version
  cluster_role_arn               = var.cluster_role_arn
  node_role_arn                  = var.node_role_arn
  worker_node_count              = var.worker_node_count
  worker_instance_type           = var.worker_instance_type
  endpoint_private_access        = var.endpoint_private_access
  endpoint_public_access         = var.endpoint_public_access
  public_access_cidrs            = var.public_access_cidrs
  enabled_cluster_log_types      = var.enabled_cluster_log_types
  eks_security_group_ids         = var.eks_security_group_ids
  worker_launch_template_id      = var.worker_launch_template_id
  worker_launch_template_version = var.worker_launch_template_version
  worker_capacity_type           = var.worker_capacity_type
  ec2_instance_type              = var.ec2_instance_type
  ec2_ami_id                     = var.ec2_ami_id
  ec2_security_group_ids         = var.ec2_security_group_ids
  ec2_instance_profile           = var.ec2_instance_profile
  ec2_root_volume_size           = var.ec2_root_volume_size
  ec2_root_volume_type           = var.ec2_root_volume_type
  ec2_kms_key_arn                = var.ec2_kms_key_arn
}
