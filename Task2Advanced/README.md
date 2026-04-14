# Модуль vm

Универсальный модуль для создания виртуальной машины в Yandex Cloud.

**Входные параметры:**
- `cores` — количество ядер
- `memory` — объём RAM (ГБ)
- `disk_size` — размер диска (ГБ)
- `subnet_id` — ID подсети
- `ssh_key` — публичный SSH-ключ
- `vm_name` — имя ВМ
- `zone` — зона (по умолчанию ru-central1-a)

**Выходы:** vm_id, external_ip, internal_ip, disk_id и команда SSH.