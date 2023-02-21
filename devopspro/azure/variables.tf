variable "vm_name" {
  default     = "vm-lnx"
  type        = string
  description = "nome da maquina"
}
variable "region" {
  default     = "East us"
  type        = string
  description = "região da maquina"
}
variable "vm_size" {
  default     = "Standard_F2"
  type        = string
  description = "size da maquina"
}
