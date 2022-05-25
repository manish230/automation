resource "azurerm_container_group" "container_image" {
  name                = var.container_image_name
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  ip_address_type     = var.ip_address_type
  dns_name_label      = var.dns_name_label
  os_type             = var.os_type

  container {
    name   = var.container_name
    image  = var.image_name
    cpu    = var.cpu_val
    memory = var.mem_val

    ports {
      port     = var.port_val
      protocol = "TCP"
    }
  }

  container {
    name   = var.sidecar_name
    image  = var.sidecar_img
    cpu    = var.sidecar_cpu
    memory = var.sidecar_mem
  }

  tags = {
    environment = var.env
  }
}

