terraform {
  required_version = "~>1.11"

  required_providers {
    talos = {
      source  = "siderolabs/talos"
      version = "0.7.1"
    }
    argocd = {
      source = "argoproj-labs/argocd"
      version = "7.5.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.36.0"
    }
  }
}

provider "talos" {
  # Configuration options
}

terraform {
}

provider "kubernetes" {
  # Configuration options
}