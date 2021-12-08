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

output "vpc_name" {
  value       = module.network.vpc.name
  description = "VPC network name"
}

output "cluster_name" {
  value       = module.k8s.cluster.name
  description = "GKE cluster name"
}

output "node_pool_name" {
  value       = module.k8s.node_pool_name
  description = "GKE node pool name"
}
