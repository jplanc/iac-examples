resource "google_cloudbuild_trigger" "main" {
  name            = "bitcoind-example-main"
  location        = "us-central1"
  filename        = "cloudbuild-main.yaml"
  service_account = "projects/bitcoind-example/serviceAccounts/182110884486-compute@developer.gserviceaccount.com"

  repository_event_config {
    repository = "projects/bitcoind-example/locations/us-central1/connections/jplanc/repositories/jplanc-bitcoind-example"
    push {
      branch = "main"
    }
  }
}

resource "google_cloudbuild_trigger" "pr" {
  name            = "bitcoind-example-pr"
  location        = "us-central1"
  filename        = "cloudbuild-pr.yaml"
  service_account = "projects/bitcoind-example/serviceAccounts/182110884486-compute@developer.gserviceaccount.com"

  repository_event_config {
    repository = "projects/bitcoind-example/locations/us-central1/connections/jplanc/repositories/jplanc-bitcoind-example"
    pull_request {
      branch = ".*"
    }
  }
}
