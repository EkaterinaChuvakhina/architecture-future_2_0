output "vm_id" {
  description = "ID виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "Имя ВМ"
  value       = yandex_compute_instance.vm.name
}

output "external_ip" {
  description = "Внешний (NAT) IP-адрес"
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}

output "internal_ip" {
  description = "Внутренний IP-адрес в подсети"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "disk_id" {
  description = "ID загрузочного диска"
  value       = yandex_compute_disk.boot_disk.id
}

output "disk_name" {
  description = "Имя загрузочного диска"
  value       = yandex_compute_disk.boot_disk.name
}

output "ssh_command" {
  description = "Готовая команда для SSH-подключения"
  value       = "ssh ubuntu@${yandex_compute_instance.vm.network_interface[0].nat_ip_address}"
}