# Build triggers on changes to terraform files in the main branch.
resource "google_cloudbuild_trigger" "main-terraform" {
  name            = "bitcoind-example-main-terraform"
  location        = "us-central1"
  filename        = "cloudbuild-main-terraform.yaml"
  service_account = "projects/bitcoind-example/serviceAccounts/182110884486-compute@developer.gserviceaccount.com"
  included_files  = ["terraform/**"]

  repository_event_config {
    repository = "projects/bitcoind-example/locations/us-central1/connections/jplanc/repositories/jplanc-bitcoind-example"
    push {
      branch = "main"
    }
  }
}

# Build triggers on changes to the Dockerfile or any k8s yamls.
resource "google_cloudbuild_trigger" "main-k8s" {
  name            = "bitcoind-example-main-k8s"
  location        = "us-central1"
  filename        = "cloudbuild-main-k8s.yaml"
  service_account = "projects/bitcoind-example/serviceAccounts/182110884486-compute@developer.gserviceaccount.com"
  included_files  = ["k8s/**", "Dockerfile"]

  repository_event_config {
    repository = "projects/bitcoind-example/locations/us-central1/connections/jplanc/repositories/jplanc-bitcoind-example"
    push {
      branch = "main"
    }
  }
}

# Build triggers upon creation and updates to pull requests.
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
