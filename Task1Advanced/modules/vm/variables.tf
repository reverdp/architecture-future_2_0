variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "zone" {
  description = "Зона доступности Yandex Cloud для виртуальной машины и дисков"
  type        = string
}

variable "cores" {
  description = "Количество ядер CPU"
  type        = number

  validation {
    condition     = var.cores > 0
    error_message = "Значение cores должно быть больше 0"
  }
}

variable "memory" {
  description = "Объем RAM в ГБ"
  type        = number

  validation {
    condition     = var.memory > 0
    error_message = "Значение memory должно быть больше 0"
  }
}

variable "image_family" {
  description = "Семейство образа для загрузочного диска"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "boot_disk_size_gb" {
  description = "Размер загрузочного диска в ГБ"
  type        = number
  default     = 15

  validation {
    condition     = var.boot_disk_size_gb > 0
    error_message = "Значение boot_disk_size_gb должно быть больше 0"
  }
}

variable "boot_disk_type" {
  description = "Тип загрузочного диска"
  type        = string
  default     = "network-ssd"
}

variable "attached_disk_name" {
  description = "Имя дополнительного диска"
  type        = string
}

variable "attached_disk_size_gb" {
  description = "Размер дополнительного диска в ГБ"
  type        = number

  validation {
    condition     = var.attached_disk_size_gb > 0
    error_message = "Значение attached_disk_size_gb должно быть больше 0"
  }
}

variable "attached_disk_type" {
  description = "Тип дополнительного диска"
  type        = string
  default     = "network-ssd"
}

variable "subnet_id" {
  description = "ID подсети для сетевого интерфейса VM"
  type        = string
}

variable "ssh_user" {
  description = "Имя пользователя для SSH-доступа"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ для доступа к VM"
  type        = string
  sensitive   = true
}

variable "enable_nat" {
  description = "Включить публичный NAT IP-адрес для VM"
  type        = bool
  default     = true
}
