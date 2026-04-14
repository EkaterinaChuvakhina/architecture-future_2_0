terraform {
  backend "s3" {
    bucket                      = "future-tfstate"
    key                         = "task2advanced/dev/terraform.tfstate"
    region                      = "ru-central1"
    endpoint                    = "https://storage.yandexcloud.net"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    force_path_style            = true
    encrypt                     = true
  }
}