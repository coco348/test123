resource "google_container_cluster" "cluster" {
  name     = local.cluster_name
  location = var.location

  remove_default_node_pool = true
  initial_node_count       = 1

  network = var.vpc_name
  subnetwork = var.subnet

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = local.node_pool_name
  location   = var.location
  cluster    = google_container_cluster.cluster.name
  node_count = var.gke_num_nodes

  node_config {
    oauth_scopes = [
        "https://www.googleapis.com/auth/compute",
        "https://www.googleapis.com/auth/devstorage.read_only",
        "https://www.googleapis.com/auth/logging.write",
        "https://www.googleapis.com/auth/monitoring",
        "https://www.googleapis.com/auth/cloud-platform",
    ]

    labels = {
      env = var.project_id
    }

    preemptible  = var.preemptible_nodes
    machine_type = var.machine_type
    tags         = ["gke-node", google_container_cluster.cluster.name]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}

resource "kubernetes_namespace" "namespace" {
for_each = var.namespaces
 metadata {
 name = each.value
 }
}
