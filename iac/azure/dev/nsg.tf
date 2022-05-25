module "dev-msg-module" {
    source         =  "../module/nsg"
    nsg_name       = var.nsg_name
    nsg_subnet_id   = var.nsg_subnet_id
    depends_on = [
    module.dev_resource_grp
  ]
}