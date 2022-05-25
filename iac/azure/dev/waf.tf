module "WAF" {
  source = "../module/waf"
  resource_group_location    =  var.resource_group_location
resource_group_name        = var.resource_group_name
firewall_name = var.firewall_name
}
