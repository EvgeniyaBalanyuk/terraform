locals {
  # Имя для web ВМ, используя интерполяцию переменных
  vm_web_name_full = "${var.vpc_name}-${var.vm_web_name}-${var.default_zone}"

  # Имя для db ВМ, используя интерполяцию переменных
  vm_db_name_full = "${var.vpc_name}-${var.vm_db_name}-${var.vpc_db_zone}"
}
