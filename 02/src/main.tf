#создаем облачную сеть develop
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

#создаем облачную подсеть zone A develop-web
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

#создаем облачную подсеть zone B develop-db
resource "yandex_vpc_subnet" "develop_b" {
  name           = var.vpc_db_name
  zone           = var.vpc_db_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vpc_db_cidr
}

# 1 VM

data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_image_family
}

resource "yandex_compute_instance" "platform_web" {
  name            = local.vm_web_name_full
  hostname        = local.vm_web_name_full
  platform_id     = var.vm_web_platform_id
  zone            = var.vpc_web_zone

  resources {
    cores          = var.vms_resources.web.cores
    memory         = var.vms_resources.web.memory
    core_fraction  = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vms_resources.web.hdd_size
      type     = var.vms_resources.web.hdd_type
    }
  }

  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }

  network_interface {
    subnet_id       = yandex_vpc_subnet.develop.id
    nat              = var.vm_web_nat
  }

  metadata = var.vms_metadata

}

# 2 VM

data "yandex_compute_image" "ubuntu_db" {
  family = var.vm_db_image_family
}

resource "yandex_compute_instance" "platform_db" {
  name        = local.vm_db_name_full
  platform_id = var.vm_db_platform_id
  zone        = var.vpc_db_zone

  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id     = data.yandex_compute_image.ubuntu_db.image_id
      size         = var.vms_resources.db.hdd_size
      type         = var.vms_resources.db.hdd_type
    }
  }

  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = var.vm_db_nat
  }

  metadata = var.vms_metadata

}

/*
output "test" {

  value = [
    { dev1 = ["ssh -o 'StrictHostKeyChecking=no' ubuntu@${yandex_compute_instance.platform_web.network_interface[0].nat_ip_address}", yandex_compute_instance.platform_web.network_interface[0].ip_address] },
    { dev2 = ["ssh -o 'StrictHostKeyChecking=no' ubuntu@${yandex_compute_instance.platform_db.network_interface[0].nat_ip_address}", yandex_compute_instance.platform_db.network_interface[0].ip_address] }

  ]
}
*/
