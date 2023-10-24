resource "null_resource" "processospowershell" {
  provisioner "local-exec" {
    command     = "Get-Process > lista.txt"
    interpreter = ["Powershell", "-Command"]
  }
}