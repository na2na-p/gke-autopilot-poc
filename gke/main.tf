provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_container_cluster" "autopilot_cluster" {
  name             = var.cluster_name
  location         = var.region
  enable_autopilot = true
  allow_net_admin  = true
  cost_management_config {
    enabled = true
  }
  deletion_protection = false # HACK: 検証用
  initial_node_count  = 1     # autopilotはリージョンクラスターなので必須

  addons_config {
    gcs_fuse_csi_driver_config {
      enabled = true
    }
  }

  cluster_autoscaling {
    enabled = true
  }
}

output "kubeconfig" {
  value = google_container_cluster.autopilot_cluster.endpoint
}
