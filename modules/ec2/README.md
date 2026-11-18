# modules/ec2

Contrato definido em variables.tf; todas as entradas são obrigatórias, exceto tags. Outputs em outputs.tf. Não configura provider ou backend.

Consulte ../../docs/decisoes.md e spec.md na raiz para pré-requisitos e decisões pendentes.

## Entradas

| Entrada | Obrigatória |
|---|---|
| `name` | Sim; ver tipo e descrição em variables.tf. |
| `tags` | Não; mapa vazio. |
| `subnet_id` | Sim; ver tipo e descrição em variables.tf. |
| `instance_type` | Sim; ver tipo e descrição em variables.tf. |
| `ami_id` | Sim; ver tipo e descrição em variables.tf. |
| `security_group_ids` | Sim; ver tipo e descrição em variables.tf. |
| `instance_profile` | Sim; ver tipo e descrição em variables.tf. |
| `root_volume_size` | Sim; ver tipo e descrição em variables.tf. |
| `root_volume_type` | Sim; ver tipo e descrição em variables.tf. |
| `kms_key_arn` | Sim; ver tipo e descrição em variables.tf. |

## Saídas

`instance_id`, `private_ip`
