### vm_db (second virtual machine)

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of the database virtual machine"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID of the database virtual machine"
}

variable "vpc_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Zone where the database VM will be deployed"
}

variable "vpc_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_db_name" {
  type        = string
  default     = "develop-b"
  description = "VPC network & subnet name"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Number of cores for the database VM"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Amount of memory in GB for the database VM"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "CPU performance share for the database VM"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Whether the database VM is preemptible"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "Enable NAT for the database VM"
}

variable "vm_db_serial_port_enable" {
  type        = bool
  default     = true
  description = "Enable serial port for the database VM"
}

variable "vm_db_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Family of the image to be used for the database VM" 
}
