# bitcoind

* Provides a Dockerfile for an image that runs bitcoind
* Builds the docker image using Google Cloud Build
* Uses Terraform to deploy a GKE cluster, Docker registry, and build triggers
* Deploys a k8s namespae, deployment, and service for bitcoind using Cloud Build
* These builds and deploys are triggered by pushes to the main branch 
