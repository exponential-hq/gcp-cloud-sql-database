terraform {
  required_providers {
    gcp = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.16.0"
    }
  }

  required_version = ">= 1.0.0"
}