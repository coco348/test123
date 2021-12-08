# This provider is used to configure your Google Cloud Platform infrastructure
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


# Add GKE cluster and node pool here
module "my_cluster" {
  source       = "./modules/gke_cluster"
  project_id   = data.google_project.project.project_id
  location     = var.zone
  cluster_name = var.name
  vpc_name     = module.my_vpc.vpc.name
}


terraform {
  backend "gcs" {
    bucket = "terraform-state-acn-devops-upskilling-gcp"
    prefix = "terraform/state/terraform-labs-Yue"
  }
}
# Add the k8s namespace here
provider "kubernetes" {
  host                   = "https://${module.my_cluster.cluster.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.my_cluster.cluster.master_auth.0.cluster_ca_certificate)

}

resource "kubernetes_namespace" "my_app" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      name = var.name
    }

    name = var.name
  }
}

resource "google_compute_instance" "project" {
  count        = 2
  name         = "test-${var.name}-${count.index}"
  machine_type = "e2-micro"
  zone         = var.zone

  tags = ["foo", "bar"]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = module.my_vpc.vpc.name
    //subnetwork = "${var.name}-subnetwork"
    access_config {
      // Ephemeral IP
    }
  }
  metadata = {
    foo = "bar"
  }
  //metadata_startup_script = file("script.sh")
  labels = {
    git_commit           = "59d47eff9dc2a89f11ab50322c9d5007c6e8c249"
    git_file             = "tf__main_tf"
    git_last_modified_at = "2021-12-08-10-38-05"
    git_last_modified_by = "ybyuan"
    git_modifiers        = "ybyuan"
    git_org              = "coco348"
    git_repo             = "test123"
    yor_trace            = "ce6467a4-8eda-44ca-bdc4-6b0480382f24"
  }
}