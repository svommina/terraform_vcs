terraform {
  cloud {
    organization = "svommina"

    workspaces {
      name = "terraform_vcs"
    }
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id     = "875ad89d-290f-44f3-a704-b6ed805992a1"
  tenant_id           = "b212c781-92a6-4793-b127-b3cfed579ef3"
  client_id           = "4cabd02b-a068-424e-bc03-dd30bc1131a6"
  client_secret       = ".C88Q~mb5opvgAaxnlBMNDW~ZklfQV6GnibBHaxP"
  features {}
}
