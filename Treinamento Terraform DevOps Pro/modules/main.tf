module "pets01" {
    source = "./pets"
    prefixo_arquivo = "teste-arquivo${each.key}"
}

module "pets" {
    source = "./pets"
    prefixo_arquivo = "teste-arquivo${each.key}"
}

