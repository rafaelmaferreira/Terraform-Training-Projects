terraform {
  backend "kubernetes" {
       
  }
}

resource "local_file" "arquivo_local" {
  filename = "arquivo.txt"
  content  = "Conteúdo"
}