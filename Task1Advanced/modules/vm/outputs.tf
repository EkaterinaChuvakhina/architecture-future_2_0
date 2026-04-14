output "vm_id" {
  description = "ID виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "Имя ВМ"
  value       = yandex_compute_instance.vm.name
}

output "external_ip" {
  description = "Внешний IP-адрес"
  value       = yandex_compute_instance.vm.network_interface[0].nat_ip_address
}

output "internal_ip" {
  description = "Внутренний IP-адрес"
  value       = yandex_compute_instance.vm.network_interface[0].ip_address
}

output "disk_id" {
  description = "ID подключаемого диска"
  value       = yandex_compute_disk.boot_disk.id
}

output "ssh_command" {
  description = "Команда для подключения по SSH"
  value       = "ssh ubuntu@${yandex_compute_instance.vm.network_interface[0].nat_ip_address}"
}