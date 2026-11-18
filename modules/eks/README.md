# modules/eks

Contrato definido em variables.tf; todas as entradas são obrigatórias, exceto tags. Outputs em outputs.tf. Não configura provider ou backend.

Consulte ../../docs/decisoes.md e spec.md na raiz para pré-requisitos e decisões pendentes.

## Entradas

| Entrada | Obrigatória |
|---|---|
| `name` | Sim; ver tipo e descrição em variables.tf. |
| `tags` | Não; mapa vazio. |
| `subnet_ids` | Sim; ver tipo e descrição em variables.tf. |
| `kubernetes_version` | Sim; ver tipo e descrição em variables.tf. |
| `cluster_role_arn` | Sim; ver tipo e descrição em variables.tf. |
| `node_role_arn` | Sim; ver tipo e descrição em variables.tf. |
| `worker_node_count` | Sim; ver tipo e descrição em variables.tf. |
| `worker_instance_type` | Sim; ver tipo e descrição em variables.tf. |
| `endpoint_private_access` | Sim; ver tipo e descrição em variables.tf. |
| `endpoint_public_access` | Sim; ver tipo e descrição em variables.tf. |
| `public_access_cidrs` | Sim; ver tipo e descrição em variables.tf. |
| `enabled_cluster_log_types` | Sim; ver tipo e descrição em variables.tf. |
| `security_group_ids` | Sim; ver tipo e descrição em variables.tf. |
| `worker_launch_template_id` | Sim; ver tipo e descrição em variables.tf. |
| `worker_launch_template_version` | Sim; ver tipo e descrição em variables.tf. |
| `worker_capacity_type` | Sim; ver tipo e descrição em variables.tf. |

## Saídas

`cluster_name`, `cluster_endpoint`, `cluster_arn`
