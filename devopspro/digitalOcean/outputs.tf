output "stack_wp_lb_ip" {
    value = module.wp-stack.wp_lb_ip
    description = "ip do load balancer"
}

output "stack_wp_vm_ips" {
    value = module.wp-stack.wp_vm_ips
    description = "ips das maquinas word press"
}

output "stack_nfs_vm_ips" {
    value = module.wp-stack.nfs_vm_ips
    description = "ips das maquina nfs"
}

output "stack_wp_db_user" {
    value = module.wp-stack.wp_db_user
    description = "usuario do banco de dados"
}

output "stack_wp_db_password" {
    value = module.wp-stack.wp_db_password
    description = "senha do banco de dados"
    sensitive = true
}








# output "lb_ip" {
#   value = digitalocean_loadbalancer.wp_lb.ip
# }

# output "database_username" {
#   value     = digitalocean_database_user.wp_database_user.name

# }

# output "database_password" {
#   value     = digitalocean_database_user.wp_database_user.password
# }