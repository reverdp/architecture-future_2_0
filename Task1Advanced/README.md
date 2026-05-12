# Task1Advanced: Terraform-модуль VM

Переиспользуемый Terraform-модуль для создания виртуальной машины в Yandex Cloud

Модуль создает:

- загрузочный диск из семейства образов, например `ubuntu-2204-lts`
- виртуальную машину с настраиваемым количеством ядер и объемом RAM
- дополнительный подключаемый диск
- сетевой интерфейс в переданной подсети
- SSH-доступ через переданный публичный ключ

## Входные параметры модуля

| Параметр                | Описание                                                                 |
|-------------------------|--------------------------------------------------------------------------|
| `vm_name`               | Имя виртуальной машины                                                   |
| `zone`                  | Зона доступности для виртуальной машины и дисков                         |
| `cores`                 | Количество ядер CPU                                                      |
| `memory`                | Объем RAM в ГБ                                                           |
| `image_family`          | Семейство образа для загрузочного диска. По умолчанию: `ubuntu-2204-lts` |
| `boot_disk_size_gb`     | Размер загрузочного диска в ГБ. По умолчанию: `15`                       |
| `boot_disk_type`        | Тип загрузочного диска. По умолчанию: `network-ssd`                      |
| `attached_disk_name`    | Имя дополнительного диска                                                |
| `attached_disk_size_gb` | Размер дополнительного диска в ГБ                                        |
| `attached_disk_type`    | Тип дополнительного диска. По умолчанию: `network-ssd`                   |
| `subnet_id`             | ID подсети для сетевого интерфейса VM                                    |
| `ssh_user`              | Имя пользователя для SSH-доступа. По умолчанию: `ubuntu`                 |
| `ssh_public_key`        | Публичный SSH-ключ для доступа к VM                                      |
| `enable_nat`            | Включить публичный NAT IP-адрес. По умолчанию: `true`                    |

## Выходные значения модуля

| Output                | Описание                              |
|-----------------------|---------------------------------------|
| `vm_id`               | ID созданной виртуальной машины       |
| `vm_name`             | Имя созданной виртуальной машины      |
| `vm_fqdn`             | FQDN созданной виртуальной машины     |
| `internal_ip_address` | Внутренний IP-адрес VM                |
| `external_ip_address` | Внешний IP-адрес VM, если включен NAT |
| `boot_disk_id`        | ID загрузочного диска                 |
| `attached_disk_id`    | ID дополнительного диска              |
| `attached_disk_name`  | Имя дополнительного диска             |

## Окружения

- `envs/dev`
- `envs/stage`
- `envs/prod`

В каждом окружении есть свой файл `*.tfvars` с разными значениями параметров: количество CPU, объем RAM, размер дисков, зона, имя VM и ID подсети.

Перед запуском нужно заменить placeholder-значения в нужном `*.tfvars` файле:

- `cloud_id`
- `folder_id`
- `subnet_id`
- `ssh_public_key`

## Запуск

Сначала нужно настроить доступ к Yandex Cloud, для этого нужно передать токен через переменную окружения:

```bash
export YC_TOKEN="<token>"
```

Запуск окружения `dev`:

```bash
cd Task1Advanced/envs/dev
terraform init
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"
```

Запуск окружения `stage`:

```bash
cd Task1Advanced/envs/stage
terraform init
terraform plan -var-file="stage.tfvars"
terraform apply -var-file="stage.tfvars"
```

Запуск окружения `prod`:

```bash
cd Task1Advanced/envs/prod
terraform init
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```

## Удаление ресурсов

```bash
terraform destroy -var-file="dev.tfvars"
```
