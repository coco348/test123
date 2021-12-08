locals {
  cluster_name   = "gke-cluster-${var.cluster_name}"
  node_pool_name = "${google_container_cluster.cluster.name}-node-pool"
}