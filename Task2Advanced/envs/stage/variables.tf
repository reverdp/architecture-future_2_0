variable "cloud_id" {
  description = "ID облака Yandex Cloud"
  type        = string
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud"
  type        = string
}

variable "zone" {
  description = "Зона доступности по умолчанию"
  type        = string
}

variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cores" {
  description = "Количество ядер CPU"
  type        = number
}

variable "memory" {
  description = "Объем RAM в ГБ"
  type        = number
}

variable "image_family" {
  description = "Семейство образа для загрузочного диска"
  type        = string
}

variable "boot_disk_size_gb" {
  description = "Размер загрузочного диска в ГБ"
  type        = number
}

variable "attached_disk_name" {
  description = "Имя дополнительного диска"
  type        = string
}

variable "attached_disk_size_gb" {
  description = "Размер дополнительного диска в ГБ"
  type        = number
}

variable "subnet_id" {
  description = "ID подсети для сетевого интерфейса VM"
  type        = string
}

variable "ssh_user" {
  description = "Имя пользователя для SSH-доступа"
  type        = string
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ для доступа к VM"
  type        = string
  sensitive   = true
}
