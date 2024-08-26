provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  node_config {
    machine_type = var.node_size
    disk_size_gb = 30
    preemptible  = true  # Set preemptible nodes if desired
  }

  initial_node_count = var.node_count
}
