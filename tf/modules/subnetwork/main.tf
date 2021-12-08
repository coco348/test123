resource "google_compute_subnetwork" "network-with-private-secondary-ip-ranges" {
  name          = "${var.subnet_name}test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = var.network
  project       = var.project_id
  
}