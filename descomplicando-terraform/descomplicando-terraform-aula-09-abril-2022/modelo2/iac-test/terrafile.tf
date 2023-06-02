provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
  bucket  = "mybucketterraformaws"
  key     = "terraform-test.tfstate"
  region  = "us-east-1"
  }
}

module "test_servers" {
  source = "../"

  tipo = "web"
  name = "testando"
}