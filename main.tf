provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"

  project_name       = var.project_name
  availability_zones = var.availability_zones
}