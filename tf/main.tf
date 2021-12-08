provider "google" {
  project = var.project_id
  region  = var.region
}

# Add configuration for remote backend here

# This data source allows Terraform configuration to use the GCP project defined outside of Terraform
data "google_project" "project" {
  project_id = var.project_id
}

data "google_client_config" "default" {}


# Add VPC here

module "my_vpc" {
  source     = "./modules/vpc"
  project_id = data.google_project.project.project_id
  vpc_name   = var.name
}

# Add subnet here

module "my_subnet" {
  source     = "./modules/subnetwork"
  project_id = data.google_project.project.project_id
  subnet_name = var.name
  network = module.my_vpc.vpc.id
  region = var.region
}