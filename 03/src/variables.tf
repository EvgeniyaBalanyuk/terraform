###cloud vars
variable "token" {
  type        = string
  default     = "y0_AgAAAABIRaajAATuwQAAAAEU8YMTAACs4IDPGz5I7KMP-ZAsWyiLW_dj6g"
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = "b1gjmpd4ofucqn84e7lj"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1ga3emslagphg3662qr"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

### VM variables
variable "web_vm_cpu" {
  type        = number
  default     = 2
  description = "Количество CPU для web ВМ"
}

variable "web_vm_ram" {
  type        = number
  default     = 4
  description = "Объем RAM для web ВМ (в ГБ)"
}

variable "web_vm_disk_size" {
  type        = number
  default     = 10
  description = "Размер диска для web ВМ (в ГБ)"
}

variable "web_vm_image_id" {
  type        = string
  default     = "fd83b9pkhhr6m7tegqjm"
  description = "ID образа для web ВМ"
}

variable "db_vm_image_id" {
  type        = string
  default     = "fd83b9pkhhr6m7tegqjm"
  description = "ID образа для ВМ баз данных"
}

variable "ssh_key_path" {
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
  description = "Путь до SSH-ключа"
}
