resource "local_file" "arquivo" {
  content  = random_pet.pet.id
  filename = "arquivo.txt"
}

resource "random_pet" "pet" { }