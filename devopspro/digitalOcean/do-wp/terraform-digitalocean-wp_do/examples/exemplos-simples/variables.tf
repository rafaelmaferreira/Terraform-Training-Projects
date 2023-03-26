variable "region" {
  type    = string
  default = "nyc1"
}

variable "wp_vm_count" {
  type        = number
  default     = 2
  description = "numero de maquinas para o wordpress"

  validation {
    condition     = var.wp_vm_count > 1
    error_message = "o numero minimo de maquinas é 2"
  }
}
variable "vms_ssh" {
  type = string
  description = "chave ssh para vms"
}