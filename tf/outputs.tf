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