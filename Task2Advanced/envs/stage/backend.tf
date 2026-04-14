terraform {
  backend "s3" {
    bucket                      = "future-tfstate"
    key                         = "task2advanced/prod/terraform.tfstate"
    region                      = "ru-central1"
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }

    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_requesting_account_id  = true     # ← это важно!
    force_path_style            = true
    encrypt                     = true
  }
}