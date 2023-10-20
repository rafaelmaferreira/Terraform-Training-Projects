terraform {
  backend "local" {
    path = "./estado-do-projeto.tfstate"
  }
}

resource "local_file" "arquivo_local" {
  filename = "arquivo.txt"
  content  = "Conteúdo"
}