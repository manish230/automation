resource "azurerm_subnet" "frontend" {
  name                 = "frontend"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.gwip_sub_id
}

resource "azurerm_public_ip" "app_gtw_pub_ip" {
  name                = var.agp_ip
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  allocation_method   = "Dynamic"
}

#&nbsp;since these variables are re-used - a locals block makes this more maintainable
locals {
  backend_address_pool_name      = "${var.vnet_name}-beap"
  frontend_port_name             = "${var.vnet_name}-feport"
  frontend_ip_configuration_name = "${var.vnet_name}-feip"
  http_setting_name              = "${var.vnet_name}-be-htst"
  listener_name                  = "${var.vnet_name}-httplstn"
  request_routing_rule_name      = "${var.vnet_name}-rqrt"
  redirect_configuration_name    = "${var.vnet_name}-rdrcfg"
}


resource "azurerm_application_gateway" "dev_apgw" {
  name                = var.apgw_name
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location

  sku {
    name     = "Standard_Small"
    tier     = "Standard"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = var.gwip_confname
    subnet_id = azurerm_subnet.frontend.id
  }

  frontend_port {
    name = local.frontend_port_name
    port = 80
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.app_gtw_pub_ip.id
  }

  backend_address_pool {
    name = local.backend_address_pool_name
    ip_addresses = [ var.container_ip_address ]
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
  }
}