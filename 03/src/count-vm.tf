resource "yandex_compute_instance" "web" {
  count = 2
  name  = "web-${count.index + 1}"

  resources {
    cores  = var.web_vm_cpu
    memory = var.web_vm_ram
  }

  boot_disk {
    initialize_params {
      image_id = var.web_vm_image_id # образ Yandex Cloud 
      size     = var.web_vm_disk_size  # Размер диска в ГБ
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [yandex_vpc_security_group.example.id]  # Группа безопасности
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.ssh_key_path)}"
  }

  depends_on = [yandex_compute_instance.db]  # Зависимость от базы данных
}
