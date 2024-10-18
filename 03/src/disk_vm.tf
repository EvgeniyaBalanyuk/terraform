# Создание трех дисков
resource "yandex_compute_disk" "storage_disk" {
  count     = 3
  name      = "storage-disk-${count.index + 1}"
  size      = 1  # Размер диска 1 ГБ
  type      = "network-hdd"  # Тип диска 
  zone      = var.default_zone
}

# Создание ВМ storage и подключение к ней дополнительных дисков
resource "yandex_compute_instance" "storage" {
  name = "storage"

  resources {
    cores  = var.web_vm_cpu
    memory = var.web_vm_ram
  }

  boot_disk {
    initialize_params {
      image_id = var.web_vm_image_id 
      size     = var.web_vm_disk_size
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_key_path)}"
  }

  # Подключение дополнительных дисков с использованием dynamic и for_each
  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      disk_id = secondary_disk.value.id
    }
  }
}
