variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "location" {
  description = "GCP region or zone"
  type        = string
}

variable "cluster_name" {
  description = "Cluster name"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "subnet" {
  type = string
  description = "subnet"
}

variable "gke_num_nodes" {
  default     = 3
  description = "Number of gke nodes"
  type        = number
}

variable "preemptible_nodes" {
  default     = true
  description = "Whether to use preemptible nodes for node pool"
  type        = bool
}

variable "machine_type" {
  default     = "n1-standard-1"
  description = "Machine type for GCP node pool"
  type        = string
}

variable "namespaces" {
  description = "names of the k8s ns"
  type        = set(string)
  default = [
    "my-app",
    "monitoring"
  ]
}