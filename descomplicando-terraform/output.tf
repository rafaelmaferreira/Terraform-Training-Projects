# output "ip_address" {
#   value = aws_instance.web.*.public_ip
# }

# output "ip_address" {
#   value = {
#   for instance in aws_instance.web:
#     instance.id => instance.private_ip
#   } 
# }