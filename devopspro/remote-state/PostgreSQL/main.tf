terraform {
  backend "pg" {
    conn_str = "postgresql://:AVNS_vQc2eqX4gmEeLSNs9bC@db-postgresql-do-user-13404829-0.b.db.ondigitalocean.com:25060/defaultdb?sslmode=require"
  }
}

resource "local_file" "arquivo_local" {
  filename = "arquivo.txt"
  content  = "Conteúdo"
}