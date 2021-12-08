provider "google" {
  project = var.project_id
  region  = var.region
}

data "google_client_config" "provider" {}

provider "kubernetes" {
  host                   = module.my_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(module.my_cluster.cluster.master_auth.0.cluster_ca_certificate)
  token                  = data.google_client_config.provider.access_token
}

terraform {
  backend "gcs" {
    bucket = "terraform-state-acn-devops-upskilling-gcp"
    prefix = "terraform/state/terraform-labs-yue"
  }
}

data "google_project" "project" {
  project_id = var.project_id
}

module "network" {
  source     = "./modules/network"
  project_id = data.google_project.project.project_id
  name       = var.name
  region     = var.region
}

module "k8s" {
  source        = "./modules/k8s"
  project_id    = data.google_project.project.project_id
  location      = var.zone
  cluster_name  = var.name
  vpc_name      = module.network.vpc.name
  subnet = module.network.subnet.name
  gke_num_nodes = var.gke_num_nodes
 
}
