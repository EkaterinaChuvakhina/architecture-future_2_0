variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cores" {
  description = "Количество ядер CPU"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Объём RAM в ГБ"
  type        = number
  default     = 4
}

variable "disk_size" {
  description = "Размер загрузочного диска в ГБ"
  type        = number
  default     = 20
}

variable "subnet_id" {
  description = "ID подсети (subnet)"
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH-ключ для пользователя ubuntu"
  type        = string
  sensitive   = true
}

variable "zone" {
  description = "Зона доступности Yandex Cloud"
  type        = string
  default     = "ru-central1-a"
}

variable "image_id" {
  description = "ID образа ОС (по умолчанию Ubuntu 22.04)"
  type        = string
  default     = "fd8r71tg4mg5b3uiholm"
}