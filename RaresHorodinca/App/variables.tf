variable "project_id" {
  description = "The ID of the project in Google Cloud."
  type        = string
}

variable "region" {
  description = "The region in which to deploy resources."
  type        = string
  default     = "europe-west1"  # Update if needed
}

variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
  default     = "my-new-cluster"
}

variable "node_count" {
  description = "The number of nodes in the Kubernetes cluster."
  type        = number
  default     = 1
}

variable "node_size" {
  description = "The machine type for Kubernetes nodes."
  type        = string
  default     = "e2-micro"  # Small size
}

