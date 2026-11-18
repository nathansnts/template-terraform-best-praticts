# stacks/eks-ec2

Contrato definido em variables.tf; todas as entradas são obrigatórias, exceto tags. Outputs em outputs.tf. Não configura provider ou backend.

## Entradas

| Entrada | Obrigatória |
|---|---|
| `name` | Sim; ver tipo e descrição em variables.tf. |
| `tags` | Não; mapa vazio. |
| `vpc_cidr` | Sim; ver tipo e descrição em variables.tf. |
| `subnets` | Sim; ver tipo e descrição em variables.tf. |
| `nat_subnet_key` | Sim; ver tipo e descrição em variables.tf. |
| `kubernetes_version` | Sim; ver tipo e descrição em variables.tf. |
| `cluster_role_arn` | Sim; ver tipo e descrição em variables.tf. |
| `node_role_arn` | Sim; ver tipo e descrição em variables.tf. |
| `worker_node_count` | Sim; ver tipo e descrição em variables.tf. |
| `worker_instance_type` | Sim; ver tipo e descrição em variables.tf. |
| `endpoint_private_access` | Sim; ver tipo e descrição em variables.tf. |
| `endpoint_public_access` | Sim; ver tipo e descrição em variables.tf. |
| `public_access_cidrs` | Sim; ver tipo e descrição em variables.tf. |
| `enabled_cluster_log_types` | Sim; ver tipo e descrição em variables.tf. |
| `eks_security_group_ids` | Sim; ver tipo e descrição em variables.tf. |
| `worker_launch_template_id` | Sim; ver tipo e descrição em variables.tf. |
| `worker_launch_template_version` | Sim; ver tipo e descrição em variables.tf. |
| `worker_capacity_type` | Sim; ver tipo e descrição em variables.tf. |
| `ec2_instance_type` | Sim; ver tipo e descrição em variables.tf. |
| `ec2_ami_id` | Sim; ver tipo e descrição em variables.tf. |
| `ec2_security_group_ids` | Sim; ver tipo e descrição em variables.tf. |
| `ec2_instance_profile` | Sim; ver tipo e descrição em variables.tf. |
| `ec2_root_volume_size` | Sim; ver tipo e descrição em variables.tf. |
| `ec2_root_volume_type` | Sim; ver tipo e descrição em variables.tf. |
| `ec2_kms_key_arn` | Sim; ver tipo e descrição em variables.tf. |

## Saídas

`vpc_id`, `subnet_ids_by_tier`, `cluster_name`, `cluster_endpoint`, `cluster_arn`, `instance_id`, `private_ip`
