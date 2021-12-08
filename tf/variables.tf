variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}

variable "zone" {
  description = "Zone"
  type        = string
}

variable "name" {
  description = "name for giving resources unique names in project"
  type        = string
}

variable "namespaces" {
  description = "names of the k8s ns"
  type        = set(string)
}

variable "gke_num_nodes" {
  type        = number
  description = "Number of nodes in node pool"
}

variable "vm_instanca_count" {
  description = "number of vm instances"
  type        = number
  default     = 2
}