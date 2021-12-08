output "cluster" {
  value       = google_container_cluster.cluster
  description = "GKE cluster name"
}

output "node_pool_name" {
  value       = google_container_node_pool.primary_nodes.name
  description = "GKE node pool name"
}