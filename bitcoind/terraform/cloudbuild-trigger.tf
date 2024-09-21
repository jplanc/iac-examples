# Build triggers on changes to terraform files in the main branch.
resource "google_cloudbuild_trigger" "main-terraform" {
  name            = "bitcoind-example-main-terraform"
  location        = "us-central1"
  filename        = "bitcoind/cloudbuild-main-terraform.yaml"
  service_account = "projects/bitcoind-example/serviceAccounts/182110884486-compute@developer.gserviceaccount.com"
  included_files  = ["bitcoind/terraform/**"]

  repository_event_config {
    repository = "projects/bitcoind-example/locations/us-central1/connections/jplanc/repositories/jplanc-iac-examples"
    push {
      branch = "main"
    }
  }
}

# Build triggers on changes to the Dockerfile or any k8s yamls.
resource "google_cloudbuild_trigger" "main-k8s" {
  name            = "bitcoind-example-main-k8s"
  location        = "us-central1"
  filename        = "bitcoind/cloudbuild-main-k8s.yaml"
  service_account = "projects/bitcoind-example/serviceAccounts/182110884486-compute@developer.gserviceaccount.com"
  included_files  = ["bitcoind/k8s/**", "bitcoind/Dockerfile"]

  repository_event_config {
    repository = "projects/bitcoind-example/locations/us-central1/connections/jplanc/repositories/jplanc-iac-examples"
    push {
      branch = "main"
    }
  }
}

# Build triggers upon creation and updates to pull requests.
resource "google_cloudbuild_trigger" "pr" {
  name            = "bitcoind-example-pr"
  location        = "us-central1"
  filename        = "bitcoind/cloudbuild-pr.yaml"
  service_account = "projects/bitcoind-example/serviceAccounts/182110884486-compute@developer.gserviceaccount.com"
  included_files  = ["bitcoind/**"]

  repository_event_config {
    repository = "projects/bitcoind-example/locations/us-central1/connections/jplanc/repositories/jplanc-iac-examples"
    pull_request {
      branch = ".*"
    }
  }
}
