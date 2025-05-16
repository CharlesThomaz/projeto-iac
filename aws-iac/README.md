
# Projeto Infraestrutura com Terraform na AWS

Este projeto define e provisiona uma infraestrutura básica na AWS utilizando **Terraform**. Ele inclui a criação de uma instância EC2, um bucket S3 e um banco de dados opcional.

---

## 📦 Estrutura de Arquivos

```

.
├── main.tf              # Recursos principais (EC2, S3, DB, etc.)
├── variables.tf         # Variáveis utilizadas no projeto
├── outputs.tf           # Saídas do Terraform
├── terraform.tfvars     # Valores das variáveis (NÃO subir no Git)
├── .gitignore           # Arquivos a serem ignorados

````

---

## ✅ Pré-requisitos

- Conta na [AWS](https://aws.amazon.com/)
- [Terraform CLI](https://developer.hashicorp.com/terraform/downloads)
- Credenciais configuradas via `aws configure` ou variável de ambiente

---

## ⚙️ Comandos principais

```bash
# Inicializa o Terraform no projeto
terraform init

# Verifica se a sintaxe está correta
terraform validate

# Mostra o que será criado/modificado
terraform plan

# Aplica as mudanças e cria os recursos
terraform apply

# Destrói os recursos criados
terraform destroy
````

---

## 🚫 .gitignore recomendado

```gitignore
# Diretório interno do Terraform
.terraform/
.terraform.lock.hcl

# Arquivos de estado
terraform.tfstate
terraform.tfstate.backup
*.tfstate*

# Variáveis sensíveis
terraform.tfvars
*.tfvars

# Outros
crash.log
*.log
```

---

## ☁️ Backend remoto (opcional)

Para armazenar o estado no S3 (recomendado em projetos em equipe), adicione no início do `main.tf`:

```hcl
terraform {
  backend "s3" {
    bucket = "nome-do-seu-bucket"
    key    = "path/terraform.tfstate"
    region = "us-east-1"
  }
}
```

---

## 🧾 Notas

* O bucket S3 e a instância EC2 serão criados com nomes definidos no arquivo `terraform.tfvars`.
* O custo da infraestrutura depende da região e dos serviços escolhidos. Verifique os preços no [AWS Pricing](https://aws.amazon.com/pricing/).

---

## 📝 Licença

Uso livre para fins educacionais e pessoais.

```



