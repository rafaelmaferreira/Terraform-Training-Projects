resource "local_file" "arquivo" {
  content  = var.conteudo
  filename = "arquivo-${terraform.workspace}.txt"
}

variable "conteudo" {
  type        = string
  description = "Conteúdo do arquivo"
}