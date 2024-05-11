terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.28.0"
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.path_to_gcp_service_account)
}

resource "google_cloud_run_v2_service" "chat-room-deployment" {
  name     = "chat-room-deployment"
  location = var.region
  ingress  = "INGRESS_TRAFFIC_ALL"
  template {
    containers {
      image = "docker.io/kiiru4reals/chat-room:latest"
      resources {
        limits = {
          cpu    = "2"
          memory = "2048Mi"
        }
      }
    }
  }
}