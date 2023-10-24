variable "name-rg" {
  type        = string
  description = "nome do rg default"
  default     = "rg-variaveis3"

}


variable "location" {
  type        = string
  description = "locazaion of the resource ex brazilsouth"
  //default     = "eastus"

}

variable "tags" {
  type        = map(any)
  description = "Tags no recursos"
  default = {
    ambiente    = "desenvolvimento"
    responsavel = "Rafael"
  }
}

variable "vnetenderecos" {
  type    = list(any)
  default = ["10.0.0.0/16", "192.168.0.0/16"]
}