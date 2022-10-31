terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.30.0"
    }
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.17.1"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
  }

  required_version = ">= 1.0.0"
}
