output "subnet" {
  value       = google_compute_subnetwork.network-with-private-secondary-ip-ranges
  description = "VPC network created by module"
}