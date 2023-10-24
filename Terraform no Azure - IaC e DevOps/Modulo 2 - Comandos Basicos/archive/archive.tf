terraform {
  required_providers {
    archive = {
      source = "hashicorp/archive"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

resource "random_string" "random" {
  length  = 5
  special = true
}


data "archive_file" "arquivozip" {
  type        = "zip"
  source_dir  = "data_backup"
  output_path = "backup_dir.zip"
}

output "arquivozip" {
  value = data.archive_file.arquivozip.output_size
}

output "random_string" {
  value = random_string.random.result

}
