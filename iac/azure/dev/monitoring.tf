module "dev_monitoring_mod" {
source                     = "../module/monitoring"
monitor_name               =  var.monitor_name
account_tier               =  var.account_tier
repl_type                  =  var.repl_type
mon_grp_name               =  var.mon_grp_name
short_name                 =  var.short_name
alert_name                 =  var.alert_name
alert_description          =  var.alert_description
namespcae_name             =  var.namespcae_name
metricname                 =  var.metricname
aggregation_type           =   var.aggregation_type
operator_type              =  var.operator_type
alert_threshold            =  var.alert_threshold
dimension_name             =  var.dimension_name
dimention_operator         =  var.dimention_operator
dimension_values           =  var.dimension_values 
}
