resource "local_file" "outro_arquivo" {
  content  = "esse é o conteudo do arquivo - ${each.key}"
  filename = "./arquivo${each.key}.txt"
  for_each = var.contador
}

variable "contador" {
  default = ["maquina01","maquina02", "maquina03"]
  type = set(string)
  
}