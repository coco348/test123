resource "google_compute_network" "vpc" {
  name                    = "vpc-${var.name}"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "subnet-${var.name}"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.vpc.id
}
