module "container_inst" {
source          =  "../module/container-img"
container_image_name           =  var.container_image_name
ip_address_type                =  var.ip_address_type
dns_name_label                 =  var.dns_name_label
os_type                        =  var.os_type
container_name                 =  var.container_name
image_name                     =  var.image_name
cpu_val                        =  var.cpu_val
mem_val                        =  var.mem_val
port_val                       =  var.port_val
sidecar_name                   =  var.sidecar_name
sidecar_img                    =  var.sidecar_img
sidecar_cpu                    =  var.sidecar_cpu
sidecar_mem                    =  var.sidecar_mem
}