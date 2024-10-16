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
  description = "VPC network & subnet name"
}

###vm_web vars

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of the virtual machine"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v3"
  description = "Platform ID of the virtual machine"
}

variable "vpc_web_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Zone where the web VM will be deployed"
}

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Family of the image to be used for the VM" 
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Number of cores for the VM"
}

variable "vm_web_memory" {
  type        = number
  default     = 1
  description = "Amount of memory in GB for the VM"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 20
  description = "CPU performance share for the VM"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Whether the VM is preemptible"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "Enable NAT for the VM"
}

variable "vm_web_serial_port_enable" {
  type        = bool
  default     = true
  description = "Enable serial port for the VM"
}

###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILjIFDCmJUNxlZjwGOz3YFEc4hSIqBv+njzLj2p9N6VK balanyuken@iMac-Evgenia.local"
  description = "ssh-keygen -t ed25519"
}
