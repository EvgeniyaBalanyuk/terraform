output "platform_web_info" {
  value = {
    instance_name = yandex_compute_instance.platform_web.name
    external_ip   = yandex_compute_instance.platform_web.network_interface[0].nat_ip_address
    fqdn          = "${yandex_compute_instance.platform_web.name}.${var.vpc_name}.cloud.yandex"
  }
}

output "platform_db_info" {
  value = {
    instance_name = yandex_compute_instance.platform_db.name
    external_ip   = yandex_compute_instance.platform_db.network_interface[0].nat_ip_address
    fqdn          = "${yandex_compute_instance.platform_db.name}.${var.vpc_name}.cloud.yandex"
  }
}
