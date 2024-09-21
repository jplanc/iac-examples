terraform {
  backend "gcs" {
    bucket = "tfstate-bitcoind-example"
  }
}
