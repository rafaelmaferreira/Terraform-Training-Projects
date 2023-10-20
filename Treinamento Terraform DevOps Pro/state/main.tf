resource "local_file" "arquivo" {
  content  = random_pet.pets[count.index].id
  filename = "${count.index}-arquivo.txt"
  count    = var.quantidade
}

resource "random_pet" "pets" {
  count = var.quantidade
}

variable "quantidade" {
  default = 4
}
