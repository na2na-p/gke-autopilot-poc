provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "autopilot_cluster" {
  name     = var.cluster_name
  location = var.region
  cost_management_config {
    enabled = true
  }
  initial_node_count = 1 # autopilotはリージョンクラスターなので必須
}

output "kubeconfig" {
  value = google_container_cluster.autopilot_cluster.endpoint
}
