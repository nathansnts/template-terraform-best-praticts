environment = "prd"
name        = "plataforma-prd"
region      = "us-east-1"
vpc_cidr    = "10.12.0.0/16"
subnets = {
  eks_a    = { tier = "private_eks", az = "us-east-1a", cidr = "10.12.0.0/20" }
  eks_b    = { tier = "private_eks", az = "us-east-1b", cidr = "10.12.16.0/20" }
  ec2_a    = { tier = "private_ec2", az = "us-east-1a", cidr = "10.12.32.0/24" }
  public_a = { tier = "public", az = "us-east-1a", cidr = "10.12.33.0/24" }
}
nat_subnet_key            = "public_a"
kubernetes_version        = "1.35"
endpoint_private_access   = true
endpoint_public_access    = false
public_access_cidrs       = []
enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
worker_node_count         = 2
worker_capacity_type      = "ON_DEMAND"
worker_instance_type      = "m6i.large"
ec2_instance_type         = "t3.small"
ec2_root_volume_type      = "gp3"
ec2_root_volume_size      = 32
