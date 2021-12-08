output "vpc" {
  value       = google_compute_network.vpc
  description = "VPC network created by module"
}