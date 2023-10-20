provider "aws" {
  region  = "us-east-1"
  version = "~> 4.0"
}

terraform {
 backend "s3" {
  bucket  = "mybucketterraformaws"
  key     = "terraform-test.tfstate"
  region  = "us-east-1"
  encrypt = true
  }
}

module "ec2" {
  source         = "git@github.com:rafaferreira011/descomplicando-terraform-modulo.git"
  app_name       = each.value.app_name
  instance_type  = each.value.instance_type
  for_each       = var.projeto
}

output "ip_address" {
  value = values(module.ec2)[*].ip_address
}