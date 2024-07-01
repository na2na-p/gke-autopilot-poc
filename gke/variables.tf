variable "project_id" {
  description = "The ID of the project in which to create the cluster"
  type        = string
}

variable "region" {
  description = "The region in which to create the cluster"
  type        = string
  default     = "asia-northeast1"
}

variable "cluster_name" {
  description = "The name of the cluster"
  type        = string
  default     = "autopilot-cluster"
}
