# ansible.tf
locals {
  web_vms = [
    for vm in yandex_compute_instance.web : {
      name = vm.name
      ip   = vm.network_interface[0].nat_ip_address
      fqdn = "${vm.hostname}.ru-central1.internal"  
    }
  ]

  db_vms = [
    for vm in yandex_compute_instance.db : {
      name = vm.name
      ip   = vm.network_interface[0].nat_ip_address
      fqdn = "${vm.hostname}.ru-central1.internal"
    }
  ]

  storage_vm = {
    name = yandex_compute_instance.storage.name
    ip   = yandex_compute_instance.storage.network_interface[0].nat_ip_address
    fqdn = "${yandex_compute_instance.storage.hostname}.ru-central1.internal"
  }
}

resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/ansible_inventory.tpl", {
    web_vms  = local.web_vms,
    db_vms   = local.db_vms,
    storage_vm = local.storage_vm
  })

  filename = "${path.module}/inventory.ini"
}
