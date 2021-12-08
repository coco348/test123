variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "name" {
  description = "vpc_name"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
}

variable "auto_create_subnetworks" {
  default     = true
  description = "Whether to create VPC in auto mode"
  type        = bool
}