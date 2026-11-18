# modules/vpc

Contrato definido em variables.tf; todas as entradas são obrigatórias, exceto tags. Outputs em outputs.tf. Não configura provider ou backend.

Consulte ../../docs/decisoes.md e spec.md na raiz para pré-requisitos e decisões pendentes.

## Entradas

| Entrada | Obrigatória |
|---|---|
| `name` | Sim; ver tipo e descrição em variables.tf. |
| `tags` | Não; mapa vazio. |
| `vpc_cidr` | Sim; ver tipo e descrição em variables.tf. |
| `subnets` | Sim; ver tipo e descrição em variables.tf. |
| `nat_subnet_key` | Sim; ver tipo e descrição em variables.tf. |

## Saídas

`vpc_id`, `subnet_ids_by_tier`, `route_table_ids_by_tier`, `nat_gateway_id`, `internet_gateway_id`
