resource "local_file" "exemplo" {
    content = join("," , [for v in var.valor: trimspace(v)])
    filename = "arquivo.txt"  
}

variable valor {
    default = ["docker", "jenkins", "terraform"]
    validation {
      condition = contains(var.valor, "kubernetes")
      error_message = "não tem"
    }
  
}