output "wp_lb_ip" {
    value = digitalocean_loadbalancer.wp_lb.ip
    description = "ip do load balancer"
}

output "wp_vm_ips" {
    value = digitalocean_droplet.vm_wp[*].ipv4_address
    description = "ips das maquinas word press"
}

output "nfs_vm_ips" {
    value = digitalocean_droplet.vm_nfs.ipv4_address
    description = "ips das maquina nfs"
}

output "wp_db_user" {
    value = digitalocean_database_user.wp_database_user.name
    description = "usuario do banco de dados"
}

output "wp_db_password" {
    value = digitalocean_database_user.wp_database_user.password
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