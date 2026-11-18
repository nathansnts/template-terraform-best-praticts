# Template Terraform EKS + EC2

Implementação de `spec.md`, organizada em módulos independentes, stack única e raízes dev/hml/prd. Entradas dependentes do projeto não possuem defaults. Nenhuma infraestrutura deve ser aplicada sem resolver os pontos em aberto em [docs/decisoes.md](docs/decisoes.md).

## Consumo

Copie `environments/` para o projeto consumidor. Substitua o source local de desenvolvimento por `git::<URL_DO_REPOSITORIO>//stacks/eks-ec2?ref=<TAG_SEMVER_PUBLICADA>` em cada raiz. O endereço de source deve ser literal; não aceita variável Terraform. Publique e selecione uma tag imutável antes do consumo remoto.

Os ambientes fixam Terraform 1.17.2 e AWS provider 6.73.0. Revise os CIDRs e o dimensionamento em terraform.tfvars. Forneça as entradas específicas da conta em um arquivo local conta.auto.tfvars. Para inicializar o backend, configure bucket e kms_key_id em backend.hcl, usando um bucket versionado na região configurada e uma chave KMS da conta. A chave do objeto e o lock nativo já estão definidos por ambiente. Use credenciais temporárias e versione o lock file gerado pelo init.

```bash
cd environments/dev
terraform init -backend-config=backend.hcl
terraform validate
terraform plan -input=false -var-file=terraform.tfvars -out=tfplan
# Revise o plano antes da execução.
terraform apply tfplan
```

Promova a mesma tag por dev, hml e prd. O único NAT é intencional conforme o diagrama e constitui dependência de uma AZ. O template não cria backend, IAM, regras de SG. A pipeline do consumidor é distribuída separadamente. Recursos existentes de identidade e segurança devem estar preparados antes da execução; SGs devem pertencer à VPC provisionada, exigindo preparação em etapa apropriada pelo consumidor.

## Extensão

Copie modules/_skeleton, implemente entradas tipadas e outputs documentados e componha o módulo no stack. Para funcionalidades novas, use uma entrada booleana com default=false. Não leia state de outros módulos diretamente. Publique MINOR para adições compatíveis e MAJOR para mudanças de contrato.

## Fontes consultadas

- MCP oficial Terraform: provider hashicorp/aws 6.73.0 e documentação de aws_eks_node_group.
- MCP Terraform Best Practices: estrutura de módulos, composição e convenções.
- spec.md: inventário R03–R14 e limites do escopo.

## GitHub Actions no consumidor

Copie o conteúdo de `templates/consumidor/.github/` para `.github/` no consumidor, inclusive a action local. Publique os workflows na branch padrão e nas branches dev, hml e prd. Proteja essas três branches exigindo pull request, sem push direto nem bypass. O push resultante do merge dispara o plano quando muda a configuração Terraform da raiz correspondente. Documentação e workflows isolados não disparam plano. Uma promoção de módulo remoto dispara plano ao alterar sua referência na raiz.

Crie os GitHub Environments dev-plan, hml-plan e prd-plan para planejamento e dev, hml e prd para aplicação. Restrinja cada um à branch correspondente. **Antes de habilitar a role de apply**, configure Required reviewers nos três ambientes de aplicação, impeça autoaprovação e desative bypass administrativo. A aprovação depende dessa configuração do repositório e de um plano GitHub que ofereça a proteção.

Configure as variáveis AWS_ROLE_ARN, STATE_BUCKET, KMS_KEY_ARN e TFVARS_JSON nos ambientes. TFVARS_JSON é um objeto JSON com as entradas específicas da conta, sem segredos. Use backend e entradas idênticos no par de cada ambiente e versione o lock file na raiz. Para módulos Git privados, configure acesso de leitura ao repositório fonte no init.

Restrinja cada role OIDC ao audience sts.amazonaws.com e ao subject repo:ORG/REPO:environment:NOME exato. A role de plano precisa ler a infraestrutura e o state e manipular o lock. A role de aplicação precisa atualizar o state e gerenciar os recursos previstos. Conceda as permissões KMS do backend.

Registre um único runner Linux x64 persistente por ambiente com a etiqueta exclusiva `terraform-dev`, `terraform-hml` ou `terraform-prd`. Restrinja esses runners aos workflows confiáveis do consumidor. Use disco criptografado e o mesmo usuário de serviço para plan e apply. O plano pode conter dados sensíveis e fica fora do checkout em `~/.local/state/terraform-plans/`, com acesso restrito ao usuário. O apply remove o arquivo após sucesso. Configure a limpeza periódica dos planos abandonados e incompletos conforme o prazo de revisão. A perda do disco exige gerar outro plano.

Revise as mudanças no log do plano. Em Actions, abra “Aplicar plano aprovado”, selecione Run workflow na mesma branch e informe o identificador e o SHA-256 do resumo. O revisor libera o job pelo GitHub Environment. O apply busca o plano pelo commit da branch e verifica o digest. Se a branch avançou, é necessário um plano para o novo commit.
