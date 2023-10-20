resource "local_file" "arquivo" {
  content  = random_pet.pet[count.index].id
  filename = "${count.index}-arquivo.txt"
  count    = var.quantidade
}

resource "random_pet" "pet" {
  count = var.quantidade
}

variable "quantidade" {
  default = 4

}