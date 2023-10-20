resource "local_file" "arquivo" {
  content  = random_pet.pet01.id
  filename = "${var.prefixo_arquivo}-arquivo.txt"
}

resource "local_file" "outro_arquivo" {
  content  = random_pet.pet02.id
  filename = "${var.prefixo_arquivo}outro_arquivo.txt"
}

resource "random_pet" "pet01" {
}


resource "random_pet" "pet02" {
}