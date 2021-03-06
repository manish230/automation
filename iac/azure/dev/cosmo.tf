 module "dev-cosmodb" {
   source             = "../module/cosmodb"
   cosmodb_name = var.cosmodb_name
   failover_location = var.failover_location
   resource_group_name =  module.dev_resource_grp.dev_resource_group_name
   depends_on = [
     module.dev_resource_grp,
     module.dev_VN
   ]
 }

