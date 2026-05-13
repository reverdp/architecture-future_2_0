# Task2Advanced: Terraform backend и CI/CD

Автоматизированное развертывание инфраструктуры через GitLab CI/CD и удаленное хранение Terraform state в S3-совместимом хранилище

В качестве S3 backend используется конфигурация, которая совместима с Yandex Object Storage, MinIO или AWS S3

## Что создает Terraform

Модуль `modules/vm` создает:

- загрузочный диск из семейства образов
- виртуальную машину Yandex Cloud
- дополнительный подключаемый диск
- сетевой интерфейс в указанной подсети
- SSH-доступ через переданный публичный ключ

## Удаленное состояние

В каждом окружении есть файл `backend.tf`:

```hcl
terraform {
  backend "s3" {}
}
```

Настройки backend вынесены в `backend.hcl`

Для изоляции состояний окружений друг от друга используются разные ключи state:

- `dev/terraform.tfstate`
- `stage/terraform.tfstate`
- `prod/terraform.tfstate`

## Настройки хранилища в Yandex Cloud

Нужно создать:
1. Bucket в Yandex Object Storage для Terraform state
2. Service Account для доступа к bucket
3. Static access key для Service Account

Выдать права для Service Account на bucket

## CI/CD переменные

В GitLab нужно добавить переменные в `Settings->CI/CD->Variables`

| Переменная              | Назначение                                |
|-------------------------|-------------------------------------------|
| `YC_TOKEN`              | Token для Terraform provider Yandex Cloud |
| `AWS_ACCESS_KEY_ID`     | Static access key ID для S3 backend       |
| `AWS_SECRET_ACCESS_KEY` | Static secret access key для S3 backend   |

## Pipeline

Файл `Task2Advanced/.gitlab-ci.yml` содержит три стадии:

- `validate` - выполняет `terraform init` и `terraform validate`
- `plan` - выполняет `terraform plan` и сохраняет plan artifact
- `apply` - выполняет `terraform apply` вручную после approval

По умолчанию используется окружение `dev`:

Для запуска `stage` или `prod` можно переопределить переменную `TF_ENV`:

```text
TF_ENV=stage
TF_ENV=prod
```

`apply` настроен как ручной job и разрешен только для default branch

## Запуск

## Настройки перед запуском

В каждом `*.tfvars` заменить:

- `cloud_id`
- `folder_id`
- `subnet_id`
- `ssh_public_key`

В каждом `backend.hcl` заменить:

- `bucket`

Если используется MinIO или другой S3-compatible backend, заменить:

- `endpoints.s3`
- `region`

Задать переменные окружения

```bash
export YC_TOKEN="$(yc token)"
export AWS_ACCESS_KEY_ID="<static-access-key-id>"
export AWS_SECRET_ACCESS_KEY="<static-secret-access-key>"
```

Запуск на примере `dev`:

```bash
cd envs/dev
terraform init -backend-config="backend.hcl"
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```
