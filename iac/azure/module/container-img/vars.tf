variable "container_image_name" {
    type = string
    default = "dev-hello-world-inst"
    description = "container_image_name"
}

variable "ip_address_type" {
    type = string
    description = "ip_address_type"
}

variable "dns_name_label" {
    type = string
    default = "dev-dns_name_label"
    description = "dns_name_label"
}
variable "resource_group_location" {
  default = "eastus"
  type   =  string
  description   = "Location of the resource group."
}

variable "os_type" {
    type = string
    default = ""
    description = "os_type"
}

variable "container_name" {
    type = string
    default = ""
    description = "container_name"
}

variable "image_name" {
  type   =  string
  default = ""
  description   = "Location of the resource group."
}

variable "cpu_val" {
    type = string
    default = ""
    description = "cpu_val"
}

variable "mem_val" {
    type = string
    default = ""
    description = "mem_val"
}

variable "port_val" {
    type = number
    default = 443
    description = "port_val"
}

variable "sidecar_name" {
    type = string
    default = ""
    description = "sidecar_name"
}

variable "sidecar_img" {
    type = string
    default = ""
    description = "sidecar_img"
}
variable "sidecar_cpu" {
    type = string
    default = ""
    description = "sidecar_cpu"
}
variable "sidecar_mem" {
    type = string
    default = ""
    description = "sidecar_mem"
}

variable "env" {
    type = string
    default = ""
    description = "env"
}
variable "resource_group_name" {
    type = string
    default = "dev-rg"
    description = "name of the resource group"
}