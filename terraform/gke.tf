# Documentation for the google terraform provider was referenced to create this file

# Create a small GKE cluster to run bitcoind workloads
resource "google_container_cluster" "bitcoind" {
  name               = "bitcoind"
  location           = "us-central1"
  initial_node_count = 1
  node_config {
    preemptible  = true
    machine_type = "e2-small"
  }
}

resource "google_container_node_pool" "bitcoind" {
  name    = "bitcoind"
  cluster = google_container_cluster.bitcoind.id
  node_config {
    machine_type = "e2-medium"
  }
  autoscaling {
    min_node_count  = 0
    max_node_count  = 2
    location_policy = "BALANCED"
  }
}
