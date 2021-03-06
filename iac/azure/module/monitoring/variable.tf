variable "monitor_name" {
    type = string
    default = "dev-storage-mon"
    description = "monitor_name"
}

variable "resource_group_name" {
    type = string
    default = "dev-rg"
    description = "resource_group_name"
}

variable "resource_group_location" {
    type = string
     default = "eastus"
    description = "resource_group_location"
}

variable "account_tier" {
    type = string
    default = ""
    description = "account_tier"
}

variable "repl_type" {
    type = string
    default = ""
    description = "repl_type"
}

variable "mon_grp_name" {
  type   =  string
  description   = "mon_grp_name"
}

variable "short_name" {
    type = string
    default = ""
    description = "short_name"
}

variable "alert_name" {
    type = string
    default = ""
    description = "alert_name"
}

variable "alert_description" {
    type = string
    default = ""
    description = "alert_description"
}

variable "namespcae_name" {
    type = string
    default = ""
    description = "namespcae_name"
}

variable "metricname" {
    type = string
    default = ""
    description = "metricname"
}
variable "aggregation_type" {
    type = string
    default = ""
    description = "aggregation_type"
}
variable "operator_type" {
    type = string
    default = ""
    description = "operator_type"
}
variable "alert_threshold" {
    type = string
    default = ""
    description = "alert_threshold"
}

variable "dimension_name" {
    type = string
    description = "dimension_name"
}

variable "dimention_operator" {
    type = string
    description = "dimention_operator"
}

variable "dimension_values" {
    type = string
    description = "dimension_values"
}