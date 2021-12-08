output "project_id" {
  value       = data.google_project.project.project_id
  description = "project_id"
}

output "region" {
  value       = var.region
  description = "region"
}

output "zone" {
  value       = var.zone
  description = "zone"
}
output "cluster_name" {
  value       = module.my_cluster.cluster.name
  description = "GKE cluster name"
}

output "node_pool_name" {
  value       = module.my_cluster.node_pool_name
  description = "GKE node pool name"
}