Развёртывание инфраструктуры автоматизировано через **GitHub Actions** с использованием **remote backend** в Yandex Object Storage (`future-tfstate`).  
Состояние Terraform хранится удалённо, а `apply` выполняется только при запуске вручную.

## Структура проекта
```
Task2Advanced/
├── modules/
│   └── vm/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── envs/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── dev.tfvars
│   │   └── backend.tf
│   ├── stage/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── stage.tfvars
│   │   └── backend.tf
│   └── prod/
│       ├── main.tf
│       ├── variables.tf
│       ├── prod.tfvars
│       └── backend.tf
├── .github/
│   └── workflows/
│       └── terraform.yml

```
### Входные параметры (variables)

| Параметр     | Тип     | Обязательный | По умолчанию          | Описание |
|--------------|---------|--------------|-----------------------|----------|
| `vm_name`    | string  | Да           | —                     | Имя виртуальной машины |
| `cores`      | number  | Нет          | 2                     | Количество ядер CPU |
| `memory`     | number  | Нет          | 4                     | Объём RAM (ГБ) |
| `disk_size`  | number  | Нет          | 20                    | Размер загрузочного диска (ГБ) |
| `subnet_id`  | string  | Да           | —                     | ID подсети |
| `ssh_key`    | string  | Да           | —                     | Публичный SSH-ключ (для пользователя `ubuntu`) |
| `zone`       | string  | Нет          | `ru-central1-a`       | Зона доступности |
| `image_id`   | string  | Нет          | `fd8r71tg4mg5b3uiholm`| ID образа ОС (Ubuntu 22.04 по умолчанию) |

### Выходные значения (outputs)

| Output          | Описание |
|-----------------|----------|
| `vm_id`         | ID виртуальной машины |
| `vm_name`       | Имя ВМ |
| `external_ip`   | Внешний (NAT) IP-адрес |
| `internal_ip`   | Внутренний IP-адрес в подсети |
| `disk_id`       | ID загрузочного диска |
| `disk_name`     | Имя загрузочного диска |
| `ssh_command`   | Готовая команда для подключения по SSH |


### CI/CD через GitHub Actions
#### Как запустить

* Перейдите во вкладку Actions.
* Выберите workflow "Terraform CI/CD — Yandex Object Storage".
* Нажмите Run workflow. 
* Выберите окружение (dev, stage или prod). 
* Нажмите Run workflow

Поведение:

terraform plan — выполняется автоматически при каждом push/pull request
terraform apply — только вручную по кнопке (manual approval)

####
Секреты GitHub
- SSH-KEY - Полный публичный SSH-ключ
- TOKEN - Yandex Cloud OAuth token
- YANDEX_ACCESS_KEY_ID,Yandex IAM → Service accounts → Static access key
- YANDEX_SECRET_ACCESS_KEY → Service accounts → Static access key


## Как запустить вручную

```bash
cd Task2Advanced/envs/dev          # или stage / prod
terraform init
terraform plan -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars