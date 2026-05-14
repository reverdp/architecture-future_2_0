output "vm_id" {
  description = "ID созданной виртуальной машины"
  value       = module.vm.vm_id
}

output "vm_name" {
  description = "Имя созданной виртуальной машины"
  value       = module.vm.vm_name
}

output "internal_ip_address" {
  description = "Внутренний IP-адрес VM"
  value       = module.vm.internal_ip_address
}

output "external_ip_address" {
  description = "Внешний IP-адрес VM"
  value       = module.vm.external_ip_address
}

output "attached_disk_id" {
  description = "ID дополнительного диска"
  value       = module.vm.attached_disk_id
}

output "boot_disk_id" {
  description = "ID загрузочного диска"
  value       = module.vm.boot_disk_id
}
