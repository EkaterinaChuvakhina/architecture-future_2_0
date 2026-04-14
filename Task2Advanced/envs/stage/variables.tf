variable "token" {
  type      = string
  sensitive = true
}
variable "cloud_id" { type = string }
variable "folder_id" { type = string }
variable "vm_name" { type = string }
variable "cores" { type = number }
variable "memory" { type = number }
variable "disk_size" { type = number }
variable "subnet_id" { type = string }
variable "ssh_key" { type = string }
variable "zone" { type = string }
variable "image_id" { type = string }
variable "minio_endpoint" {
  description = "Endpoint Minio / Yandex Object Storage"
  type        = string
}
variable "minio_access_key" {
  description = "Access Key для MinIO"
  type        = string
  sensitive   = true
}

variable "minio_secret_key" {
  description = "Secret Key для MinIO"
  type        = string
  sensitive   = true
}
