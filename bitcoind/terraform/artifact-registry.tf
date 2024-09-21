resource "google_artifact_registry_repository" "bitcoind" {
  location      = "us-central1"
  repository_id = "bitcoind"
  description   = "bitcoind docker repository"
  format        = "DOCKER"
}
