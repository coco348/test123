output "vpc" {
  value       = google_compute_network.vpc
  description = "VPC network created by module"
}

output "subnet" {
  value       = google_compute_subnetwork.subnet
  description = "VPC network created by module"
}
