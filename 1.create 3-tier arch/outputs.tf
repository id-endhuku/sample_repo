output "app_instance_names" {
  value = module.app_tier.instances.name
}

output "db_instance_names" {
  value = module.db_tier.instances.name
}

output "lb_ip" {
  value = module.lb.forwarding_rule.ip_address
}